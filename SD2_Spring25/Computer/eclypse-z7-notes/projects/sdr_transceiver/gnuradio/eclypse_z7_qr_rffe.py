#!/usr/bin/env python3

import os
import numpy
import struct
import socket
from gnuradio import gr, blocks

class PrintDataBlock(gr.basic_block):
    """Custom block to print received data to the console."""
    
    def __init__(self):
        gr.basic_block.__init__(self,
            name="PrintDataBlock",
            in_sig=[numpy.float32],  # Input type: float32 (threshold output)
            out_sig=[]  # No output
        )

    def work(self, input_items, output_items):
        """Print the received input data to the console."""
        # The input is a numpy array of floats; we will print them one by one
        for i in range(len(input_items[0])):
            print(f"Received Data: {input_items[0][i]}")  # Print each value
        return len(input_items[0])  # Return the number of items processed

class rffe(gr.hier_block2):
    '''Eclypse Z7 Qorvo Radio RF Front End Control'''

    def __init__(self, addr, port, freq, corr):
        gr.hier_block2.__init__(
            self,
            name="eclypse_z7_qr_rffe",
            input_signature=gr.io_signature(0, 0, 0),  # No input
            output_signature=gr.io_signature(1, 1, gr.sizeof_char)  # Using char for boolean output
        )
        
        # Set up control and data sockets
        self.ctrl_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.ctrl_sock.connect((addr, port))
        self.ctrl_sock.send(struct.pack('<I', 0))
        
        self.data_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.data_sock.connect((addr, port))
        self.data_sock.send(struct.pack('<I', 1))
        fd = os.dup(self.data_sock.fileno())

        # Blocks to read and process the received data
        self.source_block = blocks.file_descriptor_source(gr.sizeof_gr_complex, fd)
        self.bool_converter = blocks.complex_to_float()  # Convert gr_complex to float
        self.threshold = blocks.threshold_ff(0.0, 1.0, 0.0)  # Thresholding to convert to 0 or 1 (boolean)

        # Create a custom block to print the received data
        self.print_block = PrintDataBlock()  # Use our custom block to print data

        # Connect the blocks: source -> bool_converter -> threshold -> print_block
        self.connect(self.source_block, self.bool_converter, self.threshold, self.print_block)

        self.set_freq(freq, corr)

    def set_freq(self, freq, corr):
        # Set frequency on the control socket (using passed frequency and correction)
        self.ctrl_sock.send(struct.pack('<I', 0 << 28 | int((1.0 + 1e-6 * corr) * freq)))
