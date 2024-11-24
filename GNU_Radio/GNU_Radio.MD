# **GNU Radio**

# Setup
1. Copy Eclypse Z7 GNU Radio Blocks to C:\Users\*Username*\radioconda\Library\share\gnuradio\grc\blocks


![GNU Radio Flow](Images/GNU_RADIO_Flow_Pluto1.png)
Figure 1 GNU Radio Flow for the Pluto SDR

![GNU Radio FM radio output](Images/GNU_RADIO_Output_Pluto1.png)
Figure 2 GNU Radio output for FM radio


As a proof of concept, the team set up a websocket on the PYNQ-Z2 FPGA running in Python.  Parts of this code came from using generative AI and GNU Radio documentation.  The websocket works by sending a text string of 'LED ON' or 'LED OFF' to a specific IP Address and TCP port on the FPGA.

[GNU Radio Websocket Python Block](https://github.com/Eskdagoat/Qorvo_F24_SD/blob/main/GNU_Radio/Pluto_RX_FM/LED_Test_epy_block_1.py)
