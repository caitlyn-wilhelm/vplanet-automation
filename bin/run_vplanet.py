#!/usr/bin/env python

import subprocess as sub
import pdb
import os
import sys

final = '---- FINAL SYSTEM PROPERTIES ----'
def run_vplanet(folder_name,rerun = False):
    #get number of files
	files = sub.check_output("find %s -maxdepth 1 -mindepth 1 -type d"%folder_name, shell = True).split()
	for f in files:
		os.chdir(str(f,'utf-8'))
		if os.path.exists('tilted.log') == False or rerun == True:
	    		sub.call("vplanet vpl.in", shell = True)
		else:
	    		logf = open('tilted.log','r')
	    		lines = logf.readlines()
	    		logf.close()

	    		if final in lines:
	        		pass
	    		else:
	        		sub.call("vplanet vpl.in", shell = True)
		os.chdir("../../")
		

if (len(sys.argv) == 2):
	run_vplanet(sys.argv[1])
else:
	run_vplanet(sys.argv[1], sys.argv[2])
