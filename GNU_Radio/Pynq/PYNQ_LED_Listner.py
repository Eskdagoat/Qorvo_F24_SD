#QORVO_RADIO SD Fall 2024 Andrew Bowman
# Written by Microsoft Copilot AI and modified for used on PYNQ-Z2
#Listens on port 1005 and controls LED
from pynq import Overlay
from pynq.overlays.base import BaseOverlay
from pynq.lib import AxiGPIO
import socket


# Load the base overlay
overlay = BaseOverlay("base.bit")
led0 = overlay.leds[0]
# List available IP blocks to confirm the name
print(overlay.ip_dict.keys())

# Update the IP block name if different
# Replace 'axi_gpio_0' with the correct name found in the list
led_gpio = overlay.ip_dict.get('axi_gpio_0', None)
if led_gpio:
    led_gpio = overlay.axi_gpio_0.channel1
    led_gpio.setdirection('out')
else:
    print("AXI GPIO not found in the overlay")

# Function to control the LED
def control_led(state):
    if state == "ON":
        led0.on()  # Turn on the LED
    else:
        led0.off()  # Turn off the LED

# Set up the server to listen on port 1005
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind(('0.0.0.0', 1005))
server_socket.listen(1)

print("Server listening on port 1005")

while True:
    client_socket, addr = server_socket.accept()
    print(f"Connection from {addr}")
    data = client_socket.recv(1024).decode('utf-8')
    if data:
        print(f"Received data: {data}")
        if data == "LED ON":
            control_led("ON")
        elif data == "LED OFF":
            control_led("OFF")
        client_socket.sendall(b'ACK')  # Send acknowledgment
    client_socket.close()