## How to use

``` Bash
git clone https://github.com/T-vK/DellBiosUnpackerPOC.git
cd DellBiosUnpackerPOC
./unpack.sh /path/to/my-bios-update-exe
```

## Requirements

Requires `bash`, `git`, `python2`, `make`, `cmake` (and `vbiosfinder` in order to extract the vBIOS ROMs from the extracted BIOS files)

## Test system

I tested this using Linux (Fedeora 34 x64).  
I used this BIOS Update (for the XPS 15 9575 2-in-1): [https://dl.dell.com/FOLDER07188382M/1/XPS_15_9575_2-in-1_1.15.1.exe](https://dl.dell.com/FOLDER07188382M/1/XPS_15_9575_2-in-1_1.15.1.exe)
