# encoding: US-ASCII
# Commented lines are the original python code
# Uncommented lines are the translated ruby

#import zlib
#import sys
#import re
#import binascii
require "zlib"
require "hex_string"

#if(len(sys.argv) < 2 or sys.argv[1] == "-h"):
#    print "usage: python DecompNewDell.py <biosupdate.exe>"
#    exit()

if ARGV.length < 1 or ARGV[0] == "-h"
    puts "usage: ruby DecompNewDell.rb <biosupdate.exe>";
    exit
end

#f = open(sys.argv[1], "rb")
#string = f.read()
f = File.open(ARGV[0], 'rb')
string = f.read

#pat = re.compile(r'.{4}\xAA\xEE\xAA\x76\x1B\xEC\xBB\x20\xF1\xE6\x51.{1}\x78\x9C')
#match = pat.search(string)
#(start_match, end_match) = match.span()
regex_String = ".{4}\xAA\xEE\xAA\x76\x1B\xEC\xBB\x20\xF1\xE6\x51.{1}\x78\x9C"
pat = Regexp.compile(regex_String)
start_match, end_match = string.enum_for(:scan, pat).map { Regexp.last_match.begin(0) }

#compessed_len = string[start_match:start_match+4]
compressed_len = string[start_match..start_match+3]

#compessed_len = binascii.b2a_hex(compessed_len[::-1])
compressed_len.reverse!
compressed_len = compressed_len.to_hex_string(false)

#compessed_len = long(compessed_len, 16)
compressed_len = compressed_len.to_i(16)

#read len bytes out of the file into the new string to decompress
#f.seek(start_match+16)
#string = f.read(compessed_len)
f.seek start_match+16
string = f.read compressed_len

#o = zlib.decompress(string)
o = Zlib::Inflate.inflate(string)

#f2 = open(sys.argv[1] + "_decompressed.hdr", "wb")
#f2.write(o)
#f.close()
#f2.close()
#print "Decompressed data written to %s_decompressed.hdr" % sys.argv[1]
f2 = File.open(ARGV[0] + "_decompressed.hdr", 'wb')
f2.write(o)
f.close()
f2.close()
puts "Decompressed data written to #{ARGV[0]}_decompressed.hdr"
