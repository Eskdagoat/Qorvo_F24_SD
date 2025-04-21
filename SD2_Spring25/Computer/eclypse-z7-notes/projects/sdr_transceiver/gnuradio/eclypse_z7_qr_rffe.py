#!/usr/bin/env python3

import os
import numpy
import struct
import socket
import threading
from gnuradio import gr, blocks

class rffe(gr.hier_block2):
    '''Eclypse Z7 Qorvo Radio RF Front End Control'''

    def __init__(self, addr, port, freq, corr):
        gr.hier_block2.__init__(
            self,
            name="eclypse_z7_qr_rffe",
            input_signature=gr.io_signature(0, 0, 0),
            output_signature=gr.io_signature(1, 1, gr.sizeof_gr_complex)
        )

        # Control socket to communicate with the server
        self.ctrl_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.ctrl_sock.connect((addr, port))
        self.ctrl_sock.send(struct.pack('<I', 0))  # Command to start receiving

        # Data socket to receive actual data from the server
        self.data_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.data_sock.connect((addr, port))
        self.data_sock.send(struct.pack('<I', 1))  # Command to start receiving data

        fd = os.dup(self.data_sock.fileno())  # Create a file descriptor from the socket
        self.connect(blocks.file_descriptor_source(gr.sizeof_gr_complex, fd), self)

        # Set frequency if provided
        self.set_freq(freq, corr)

        # Create a socket for receiving the status
        self.status_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.status_sock.connect((addr, port))

        # Start a background thread to check for status
        self.status_thread = threading.Thread(target=self.status_check)
        self.status_thread.daemon = True
        self.status_thread.start()

        # This will hold the current status from the server (1 for data, 0 for no data)
        self.data_status = 0

    def set_freq(self, freq, corr):
        '''Send frequency command to the server'''
        self.ctrl_sock.send(struct.pack('<I', 0 << 28 | int((1.0 + 1e-6 * corr) * freq)))

    def status_check(self):
        '''Thread function that checks for FIFO status from the server'''
        while True:
            try:
                # Receive status (1 or 0) from the server
                status = self.status_sock.recv(1)
                if status:
                    # Convert the byte received to an integer
                    self.data_status = struct.unpack('B', status)[0]
            except Exception as e:
                print(f"Error reading status: {e}")
                break

    def work(self, input_items, output_items):
        '''Override work function to handle output based on status'''
        # If data is available (data_status == 1), process the incoming stream
        if self.data_status == 1:
            # We can pass the data from the socket through as needed
            output_items[0][:] = input_items[0]  # For example, just pass through data
        else:
            # No data available; output a zeroed array or handle as needed
            output_items[0][:] = numpy.zeros(len(output_items[0]), dtype=output_items[0].dtype)

        return len(output_items[0])
