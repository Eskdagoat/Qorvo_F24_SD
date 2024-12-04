import socket

client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect(('192.168.49.99', 1005))
client_socket.sendall(b'LED OFF')
response = client_socket.recv(1024)
print(f"Received response: {response.decode('utf-8')}")
client_socket.close()