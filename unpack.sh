#!/bin/bash

BIOS_UPDATE_FILE="$1"

# Unpack the HDR from the EXE
#python2 ./hdr-unpack.py "$BIOS_UPDATE_FILE"

#gem install zlib hex_string
ruby ./hdr-unpack.rb "$BIOS_UPDATE_FILE"

# Build PFSExtractor
git clone https://github.com/LongSoft/PFSExtractor.git
cd PFSExtractor
cmake ./
make
cd ..

# Unpack the hdr file.
./PFSExtractor/PFSExtractor "${BIOS_UPDATE_FILE}_decompressed.hdr"

# 
cd "${BIOS_UPDATE_FILE}_decompressed.hdr.extracted"

# Get the full name and path of the payload file
PAYLOAD_FILE="$(pwd)/$(echo *.payload)"


echo "#####################"
echo "#####################"
echo "#####################"
echo "Please adjust the path to your VBiosFinder installation otherwise the following will fail:"
echo "#####################"
echo "#####################"
echo "#####################"
cd /home/fedora/Projects/misc/VBiosFinder
./vbiosfinder extract "$PAYLOAD_FILE"
