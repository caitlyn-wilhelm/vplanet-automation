#This makes the contour plot
import subprocess as sub
import numpy as np
import matplotlib.pyplot as plt
import vplot
import os



#sets the labels or the x and y axis


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

plt.savefig("contour_plots/images/"+ folder + ".png")

