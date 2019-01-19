#!/usr/bin/env python

import subprocess as sub
import pdb
import os
import climaplot as cpl
import sys

final = '---- FINAL SYSTEM PROPERTIES ----\n'
def run_through(folder_name):
    #os.chdir("../PreMAP2016/Project")
    
    files = sub.check_output("ls -d %s/*/"%folder_name, shell = True).split()
    print(files)

    if len(files) > 0:
        for f in files:
            os.chdir(f)
            if os.path.exists('tilted.log'):
                logf = open('tilted.log','r')
                lines = logf.readlines()
                logf.close()
                if final in lines:
                     compl = True
        else:
            compl = False
        os.chdir("../../")

    else:
        if os.path.exists('tilted.log'):
            logf = open('tilted.log','r')
            lines = logf.readlines()
            logf.close()

            if final in lines:
                compl = True
        else:
            compl = False
			
    #comp_list = compl.split()
    #c = comp_list[-1]
    return compl

result = run_through(sys.argv[1])
print(result)



