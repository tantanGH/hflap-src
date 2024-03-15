#
#  utf-8 to sjis(cp932) code mapping table generation tool (output: HAS *.s format)
#

import os
import sys

code_map = {}

def convert(cp932_code_from, cp932_code_to):
  for i in range(cp932_code_from, cp932_code_to + 1):
    try:
      cp932_bytes = bytes([i]) if i < 256 else bytes([i >>8, i & 0xff])
      utf8_str = cp932_bytes.decode('cp932')
      utf8_bytes = utf8_str.encode('utf-8')
      cp932_code = "0x{:04x}".format(i)
      if len(utf8_bytes) == 2:
        key = utf8_bytes[0]
        key2 = "0x{:02x}".format(utf8_bytes[1])
        if key in code_map:
          code_map[key].extend([key2, cp932_code])
        else:
          code_map[key] = [key2, cp932_code]
      elif len(utf8_bytes) == 3:
        key = utf8_bytes[0]
        key2 = "0x{:04x}".format(int.from_bytes(utf8_bytes[1:3], 'big'))
        if key in code_map:
          code_map[key].extend([key2, cp932_code])
        else:
          code_map[key] = [key2, cp932_code]
    except UnicodeDecodeError:
      pass

convert(0x20, 0x7e)
convert(0xa0, 0xdf)

convert(0x8140, 0x81ff)
convert(0x8240, 0x82ff)
convert(0x8340, 0x83df)
convert(0x8440, 0x84bf)
convert(0x8740, 0x879f)
convert(0x8890, 0x88ff)
convert(0x8940, 0x89ff)
convert(0x8a40, 0x8aff)
convert(0x8b40, 0x8bff)
convert(0x8c40, 0x8cff)
convert(0x8d40, 0x8dff)
convert(0x8e40, 0x8eff)
convert(0x8f40, 0x8fff)

convert(0x9040, 0x90ff)
convert(0x9140, 0x91ff)
convert(0x9240, 0x92ff)
convert(0x9340, 0x93ff)
convert(0x9440, 0x94ff)
convert(0x9540, 0x95ff)
convert(0x9640, 0x96ff)
convert(0x9740, 0x97ff)
convert(0x9840, 0x98ff)
convert(0x9940, 0x99ff)
convert(0x9a40, 0x9aff)
convert(0x9b40, 0x9bff)
convert(0x9c40, 0x9cff)
convert(0x9d40, 0x9dff)
convert(0x9e40, 0x9eff)
convert(0x9f40, 0x9fff)

convert(0xe040, 0xe0ff)
convert(0xe140, 0xe1ff)
convert(0xe240, 0xe2ff)
convert(0xe340, 0xe3ff)
convert(0xe440, 0xe4ff)
convert(0xe540, 0xe5ff)
convert(0xe640, 0xe6ff)
convert(0xe740, 0xe7ff)
convert(0xe840, 0xe8ff)
convert(0xe940, 0xe9ff)
convert(0xea40, 0xeaff)

convert(0xfa40, 0xfaff)
convert(0xfb40, 0xfbff)
convert(0xfc40, 0xfcff)

sep = ","
print("#include <stdint.h>")
print()
for key in sorted(code_map.keys()):
  vals = code_map[key]
  print(f"int16_t utf8_to_cp932_{key:02x}_len = {len(vals)//2};")
  print(f"uint16_t utf8_to_cp932_{key:02x}[] = {{")
  for i in range(1 + len(vals)//16):
    vals2 = vals[i * 16 : i * 16 + 16]
    if len(vals2) > 0:
      print(f"  {sep.join(vals2)},")
  print(f"}};")
  print()
