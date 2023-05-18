import socket

def send_file(file_path, host, port):
    # Open the file in binary mode
    with open(file_path, 'rb') as file:
        # Create a TCP socket
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        print("Created sock")
        try:
            print("connecting")
            # Connect to the receiving machine
            sock.connect((host, port))
            print("connected")
            # Read and send the file in chunks
            chunk = file.read(1024)
            while chunk:
                sock.send(chunk)
                chunk = file.read(1024)

            # Notify the receiving machine that the file transfer is complete
            sock.shutdown(socket.SHUT_WR)

        finally:
            # Close the socket
            sock.close()

# Usage example
file_path = 'soundcard1.wav'
host = '192.168.1.131'
port = 32000

send_file('soundcard1.wav', host, port)
send_file('soundcard2.wav', host, port)
send_file('soundcard3.wav', host, port)
send_file('soundcard4.wav', host, port)
