#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#
# SPDX-License-Identifier: GPL-3.0
#
# GNU Radio Python Flow Graph
# Title: Not titled yet
# Author: ambsc
# GNU Radio version: 3.10.10.0

from PyQt5 import Qt
from gnuradio import qtgui
from PyQt5.QtCore import QObject, pyqtSlot
from gnuradio import blocks
from gnuradio import gr
from gnuradio.filter import firdes
from gnuradio.fft import window
import sys
import signal
from PyQt5 import Qt
from argparse import ArgumentParser
from gnuradio.eng_arg import eng_float, intx
from gnuradio import eng_notation
import LED_Test_epy_block_1 as epy_block_1  # embedded python block



class LED_Test(gr.top_block, Qt.QWidget):

    def __init__(self):
        gr.top_block.__init__(self, "Not titled yet", catch_exceptions=True)
        Qt.QWidget.__init__(self)
        self.setWindowTitle("Not titled yet")
        qtgui.util.check_set_qss()
        try:
            self.setWindowIcon(Qt.QIcon.fromTheme('gnuradio-grc'))
        except BaseException as exc:
            print(f"Qt GUI: Could not set Icon: {str(exc)}", file=sys.stderr)
        self.top_scroll_layout = Qt.QVBoxLayout()
        self.setLayout(self.top_scroll_layout)
        self.top_scroll = Qt.QScrollArea()
        self.top_scroll.setFrameStyle(Qt.QFrame.NoFrame)
        self.top_scroll_layout.addWidget(self.top_scroll)
        self.top_scroll.setWidgetResizable(True)
        self.top_widget = Qt.QWidget()
        self.top_scroll.setWidget(self.top_widget)
        self.top_layout = Qt.QVBoxLayout(self.top_widget)
        self.top_grid_layout = Qt.QGridLayout()
        self.top_layout.addLayout(self.top_grid_layout)

        self.settings = Qt.QSettings("GNU Radio", "LED_Test")

        try:
            geometry = self.settings.value("geometry")
            if geometry:
                self.restoreGeometry(geometry)
        except BaseException as exc:
            print(f"Qt GUI: Could not restore geometry: {str(exc)}", file=sys.stderr)

        ##################################################
        # Variables
        ##################################################
        self.samp_rate = samp_rate = 32000
        self.mixer_chooser1 = mixer_chooser1 = 0

        ##################################################
        # Blocks
        ##################################################

        # Create the options list
        self._mixer_chooser1_options = [0, 1]
        # Create the labels list
        self._mixer_chooser1_labels = ['Low End', 'High End']
        # Create the combo box
        # Create the radio buttons
        self._mixer_chooser1_group_box = Qt.QGroupBox("Mixer Status" + ": ")
        self._mixer_chooser1_box = Qt.QVBoxLayout()
        class variable_chooser_button_group(Qt.QButtonGroup):
            def __init__(self, parent=None):
                Qt.QButtonGroup.__init__(self, parent)
            @pyqtSlot(int)
            def updateButtonChecked(self, button_id):
                self.button(button_id).setChecked(True)
        self._mixer_chooser1_button_group = variable_chooser_button_group()
        self._mixer_chooser1_group_box.setLayout(self._mixer_chooser1_box)
        for i, _label in enumerate(self._mixer_chooser1_labels):
            radio_button = Qt.QRadioButton(_label)
            self._mixer_chooser1_box.addWidget(radio_button)
            self._mixer_chooser1_button_group.addButton(radio_button, i)
        self._mixer_chooser1_callback = lambda i: Qt.QMetaObject.invokeMethod(self._mixer_chooser1_button_group, "updateButtonChecked", Qt.Q_ARG("int", self._mixer_chooser1_options.index(i)))
        self._mixer_chooser1_callback(self.mixer_chooser1)
        self._mixer_chooser1_button_group.buttonClicked[int].connect(
            lambda i: self.set_mixer_chooser1(self._mixer_chooser1_options[i]))
        self.top_layout.addWidget(self._mixer_chooser1_group_box)
        self.epy_block_1 = epy_block_1.blk(example_param=mixer_chooser1)
        self.blocks_null_source_0_0 = blocks.null_source(gr.sizeof_int*1)


        ##################################################
        # Connections
        ##################################################
        self.connect((self.blocks_null_source_0_0, 0), (self.epy_block_1, 0))


    def closeEvent(self, event):
        self.settings = Qt.QSettings("GNU Radio", "LED_Test")
        self.settings.setValue("geometry", self.saveGeometry())
        self.stop()
        self.wait()

        event.accept()

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate

    def get_mixer_chooser1(self):
        return self.mixer_chooser1

    def set_mixer_chooser1(self, mixer_chooser1):
        self.mixer_chooser1 = mixer_chooser1
        self._mixer_chooser1_callback(self.mixer_chooser1)
        self.epy_block_1.example_param = self.mixer_chooser1




def main(top_block_cls=LED_Test, options=None):

    qapp = Qt.QApplication(sys.argv)

    tb = top_block_cls()

    tb.start()

    tb.show()

    def sig_handler(sig=None, frame=None):
        tb.stop()
        tb.wait()

        Qt.QApplication.quit()

    signal.signal(signal.SIGINT, sig_handler)
    signal.signal(signal.SIGTERM, sig_handler)

    timer = Qt.QTimer()
    timer.start(500)
    timer.timeout.connect(lambda: None)

    qapp.exec_()

if __name__ == '__main__':
    main()
