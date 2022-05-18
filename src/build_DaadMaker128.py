import os, sys
sys.path.append(os.path.dirname(__file__))

from phpTemplates.functions import write_file, get_hex_string, read_file
from phpTemplates.template import CustomTemplate


d = dict(LOADER_BYTES=get_hex_string("loader.bin"))

template = CustomTemplate(read_file("DAADMaker128_template.php"))
try:
    write_file("DAADMaker128.php", template.substitute(d))
except (ValueError, KeyError):
    print("Error on template")
    sys.exit(1)