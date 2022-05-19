import os, sys
sys.path.append(os.path.dirname(__file__))

from phpTemplates.functions import write_file, get_compress_string, read_file
from phpTemplates.template import CustomTemplate


d = dict(LOADER_BYTES=get_compress_string("loaderplus3.bin"))

template = CustomTemplate(read_file("DAADMakerPlus3_template.php"))
try:
    write_file("DAADMakerPlus3.php", template.substitute(d))
except (ValueError, KeyError):
    print("Error on template")
    sys.exit(1)