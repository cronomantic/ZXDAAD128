import os
import sys
import zlib
import base64

def read_file(file_path):
#check if file is present
    if not os.path.isfile(file_path):
        print("File not found")
        sys.exit(1)
    #open text file in read mode
    try:
        text_file = open(file_path, mode="r", encoding="utf-8")
        data = text_file.read()
    except OSError:
        print ("Could not open/read file:", file_path)
        sys.exit(2)
    finally:
        #close file
        text_file.close()
    return data

def write_file(file_path, data):
    try:
        text_file = open(file_path, mode="w", encoding="utf-8")
        text_file.write(data)
    except OSError:
        print ("Could not open/read file:", file_path)
        sys.exit(2)
    finally:
        #close file
        text_file.close()


def bytes_to_c_arr(data):
    return [format(b, '#04x') for b in data]

def get_hex_string(file_path):
    if not os.path.isfile(file_path):
        print("File not found")
        sys.exit(1)
    try:
        bin_file = open(file_path, mode="rb")
        hex_string = ""
        while True:
            byte = bin_file.read(1)
            if byte:
                str1 = "0x{0}".format(byte.hex())
                if hex_string:
                    hex_string = hex_string + "," + str1
                else:
                    hex_string = str1
            else:
                break
    except OSError:
        print ("Could not open/read file:", file_path)
        sys.exit(2)
    finally:
        #close file
        bin_file.close()
    return hex_string

def get_compress_string(file_path):
    if not os.path.isfile(file_path):
        print("File not found")
        sys.exit(1)
    try:
        bin_file = open(file_path, mode="rb")
        data = base64.b64encode(zlib.compress(bin_file.read())).decode('ascii')
    except OSError:
        print ("Could not open/read file:", file_path)
        sys.exit(2)
    finally:
        #close file
        bin_file.close()
    return data

