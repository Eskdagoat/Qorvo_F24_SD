"""
Embedded Python Blocks:

Each time this file is saved, GRC will instantiate the first class it finds
to get ports and parameters of your block. The arguments to __init__  will
be the parameters. All of them are required to have default values!
"""

import numpy as np
from gnuradio import gr


class blk(gr.sync_block):  # other base classes are basic_block, decim_block, interp_block
    """Embedded Python Block example - a simple multiply const"""

    def __init__(self, status=1.0):  # only default arguments here
        """arguments to this function show up as parameters in GRC"""
        gr.sync_block.__init__(
            self,
            name='Mixer Controller (Python)',   # will show up in GRC
            in_sig=None,
            out_sig = None
        )
        # if an attribute with the same name as a parameter is found,
        # a callback is registered (properties work, too).
        self.status = status

    def work(self, input_items, output_items):
        if ( staus == 1):
            client_socket.sendall(b'LED ON')
        if ( staus == 0):
            client_socket.sendall(b'LED OFF')