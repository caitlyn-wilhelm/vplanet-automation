#!/usr/bin/env python

#This makes the contour plot

import subprocess as sp
import numpy as np
import matplotlib.pyplot as plt
import vplot
import os
import sys


#imports variables from contour_plots.sh
dest = sys.argv[1]
sub_f = sys.argv[2]
num = sys.argv[3]
yaxis = sys.argv[4]
vspace = sys.argv[5]
num = int(num)

if len(sys.argv) > 6:
    ymin = sys.argv[6]
    ymin = float(ymin)
    ymax = sys.argv[7]
    ymax = float(ymin)

#sets directory
#os.chdir('../PreMAP2016/Project')
#configures contourplot
folders = sp.check_output("echo " + dest + "/" + sub_f + "*", shell=True).split()
listf = 'contour_plots/lists/list_' + dest

#if the list file exists, unpack it for graphing 
if os.path.exists(listf):
    lum0,obliq0,semi0,albedo_f,totice_m,snowball = np.loadtxt(listf, unpack = True)

#if the list files does not exist, create it
else:
    lum0 = np.zeros(len(folders))
    obliq0 = np.zeros(len(folders))
    semi0 = np.zeros(len(folders))
    albedo_f = np.zeros(len(folders))
    totice_m = np.zeros(len(folders))
    snowball = np.zeros(len(folders))

    crap = open(listf,"w")
    for i in np.arange(len(folders)):
        f = folders[i].decode("utf-8")
        out = vplot.GetOutput(f)
        lum0[i] = getattr(out.log.initial, 'sun').Luminosity
        obliq0[i] = getattr(out.log.initial, 'earth').Obliquity
        semi0[i] = getattr(out.log.initial, 'earth').SemiMajorAxis
        albedo_f[i] = out.earth.AlbedoGlobal[-1]  # -1 gives you the last entry in an array
        totice_m[i] = out.earth.TotIceMass[-1]
        snowball[i] = getattr(out.log.final, 'earth').Snowball
        crap.write("%f %f %f %f %f %f \n"%(lum0[i],obliq0[i],semi0[i],albedo_f[i],totice_m[i],snowball[i]))
    crap.close()

lum0 = np.reshape(lum0,(num,num))
obliq0 = np.reshape(obliq0,(num,num)) * 180/np.pi
semi0 = np.reshape(semi0,(num,num)) /1.49598e11
albedo_f = np.reshape(albedo_f,(num,num))
totice_m = np.reshape(totice_m,(num,num))
snowball = np.reshape(snowball,(num,num))


#creates contour plot
if yaxis == "A":
    
    #plt.ylim(ymin,ymax)
    plt.xlabel("Obliquity")
    plt.ylabel("Semi-Major Axis [AU]")
    
    
    c0 = plt.contourf(obliq0, semi0, albedo_f, cmap = 'Blues_r')
    c1 = plt.contour(obliq0, semi0, totice_m, [0], colors = 'k', linewidths = 3)
    c2 = plt.contour(obliq0, semi0, snowball, 1, colors = 'green', linestyles = 'dashed',  linewidths = 3)
    
    c1.collections[0].set_label("Total Ice Mass [kg]")
    c2.collections[0].set_label("Snowball State")
    plt.legend()

    pl = plt.colorbar(c0, ax = None)
    pl.set_label("Global Albedo")
    
    
elif yaxis == "S":

    a_earth = 1
    L_sun = 3.846e26 

    s = ((lum0/(semi0**2))/(L_sun/(a_earth**2)))

    plt.xlabel("Obliquity")
    plt.ylabel("Stellar Flux [W/m^2]")

    c0 = plt.contourf(obliq0, s, albedo_f, cmap = 'Blues_r')
    c1 = plt.contour(obliq0, s, totice_m, [0], colors = 'k', linewidths = 3)
    c2 = plt.contour(obliq0, s, snowball, 1, colors = 'green', linestyles = 'dashed',  linewidths = 3)
    
    c1.collections[0].set_label("Total Ice Mass [kg]")
    c2.collections[0].set_label("Snowball State")
    plt.legend()

    pl = plt.colorbar(c0, ax = None)
    pl.set_label("Global Albedo")

plt.savefig("contour_plots/images/normal/" + dest + ".png")

