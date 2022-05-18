import os, sys
sys.path.append(os.path.dirname(__file__))

from phpTemplates.functions import write_file, get_compress_string, read_file
from phpTemplates.template import CustomTemplate


d = dict(BIN_TAPE_ES_C42=get_compress_string("ZXD128_TAPE_ES_C42.BIN"),\
         BIN_TAPE_EN_C42=get_compress_string("ZXD128_TAPE_EN_C42.BIN"),\
         BIN_TAPE_ES_C32=get_compress_string("ZXD128_TAPE_ES_C32.BIN"),\
         BIN_TAPE_EN_C32=get_compress_string("ZXD128_TAPE_EN_C32.BIN"),\
         BIN_PLUS3_ES_C42=get_compress_string("ZXD128_PLUS3_ES_C42.BIN"),\
         BIN_PLUS3_EN_C42=get_compress_string("ZXD128_PLUS3_EN_C42.BIN"),\
         BIN_PLUS3_ES_C32=get_compress_string("ZXD128_PLUS3_ES_C32.BIN"),\
         BIN_PLUS3_EN_C32=get_compress_string("ZXD128_PLUS3_EN_C32.BIN"),\
        )

template = CustomTemplate(read_file("drb128_template.php"))
try:
    write_file("drb128.php", template.substitute(d))
except (ValueError, KeyError):
    print("Error on template")
    sys.exit(1)
