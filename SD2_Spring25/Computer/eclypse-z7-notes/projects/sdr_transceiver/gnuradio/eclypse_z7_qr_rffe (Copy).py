#!/usr/bin/env python3

import os
import numpy
import struct
import socket
from gnuradio import gr, blocks

class rffe(gr.hier_block2):
  '''Eclypse Z7 Qorvo Radio RF Front End Control'''

  def __init__(self, addr, port, freq, corr):
    gr.hier_block2.__init__(
      self,
      name = "eclypse_z7_qr_rffe",
      input_signature = gr.io_signature(0, 0, 0),
      output_signature = gr.io_signature(1, 1, gr.sizeof_gr_complex)
    )
    self.ctrl_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    self.ctrl_sock.connect((addr, port))
    self.ctrl_sock.send(struct.pack('<I', 0))
    self.data_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    self.data_sock.connect((addr, port))
    self.data_sock.send(struct.pack('<I', 1))
    fd = os.dup(self.data_sock.fileno())
    self.connect(blocks.file_descriptor_source(gr.sizeof_gr_complex, fd), self)
    self.set_freq(freq, corr)

  def set_freq(self, freq, corr):
    self.ctrl_sock.send(struct.pack('<I', 0<<28 | int((1.0 + 1e-6 * corr) * freq)))