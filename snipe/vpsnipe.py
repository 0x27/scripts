from BeautifulSoup import BeautifulSoup as bs
import sys
import hashlib
import re
import urllib2
import os 
import socket
import subprocess
import base64

def parse(url, id):
	decodeurl = base64.b64decode(url)
	f = urllib2.urlopen(decodeurl)
	data = f.read()
	os.chdir('/var/www/snipe/')
	with open("sample", "wb") as code:
		code.write(data)
	md5 = hashlib.md5(url).hexdigest()
	nique = id
	subprocess.call(['mv', 'sample', md5])
	subprocess.call(['zip', '-P', 'infected', nique, md5])
	subprocess.call(['rm', md5])

	
if __name__ == "__main__":
	#source list
	thefile = str(sys.argv[1])
	theid =  str(sys.argv[2])
	parse(thefile, theid)
