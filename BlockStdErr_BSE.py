# calculation of block standard error (bse) for rmsd values
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
#from ashan import pubfig as pf
#pf.setup() #pf.save
import string
import os

all_rmsd = np.array([])
time = np.array([])
bse = np.array([])

# block average analysis for the [minframe,maxframe] of each traj
minframe = 0
maxframe = 3901
ntraj = 2
# convert factor for frames to ns
time_fact = 1/20

	 
for i in range(1,ntraj+1):
	inp_name = 'rmsd-*PDB*-Apo-global-%d-50ps-5.xvg'%i 
	inp_data = np.loadtxt(inp_name, comments=['@', '#', '&'])[minframe:maxframe]
	rmsd = inp_data[:,1]
	all_rmsd = np.concatenate(([all_rmsd,rmsd]), axis=None)
	print(len(all_rmsd))
	print((all_rmsd))
	tot_frames = len(all_rmsd) 

# calculate bse at n points in the [minrange,maxframe] interval of each traj
minrange = 1
framestep = 1

# threshold for total frames included in bse calculation below
totframe_frac = .99

global maxrange
maxrange = maxframe - minframe
trajframes = maxrange * ntraj
for n in range(minrange,maxrange+framestep,framestep):
      # number of blocks of size n
      M = int(np.trunc(trajframes/n)) 
      # total number of frames in truncated dataset
      tot_frames = M*n 
      #print(n,M,tot_frames)
      # calculate bse only block sizes above truncation threshold 
      if (tot_frames >= totframe_frac*trajframes ):
            new_rmsd = all_rmsd[:tot_frames]
            #print(len(new_rmsd))

            array=np.reshape(new_rmsd, (-1,n))
            #print(np.shape(array))
            #print(array)
            blk_mean = np.mean(array, axis=1)
            #print(blk_mean)
            #blk_mean_all = np.mean(blk_mean)
            #print(blk_mean_all)
            time = np.append(time, [n], axis=0)
            bse=np.append(bse, [np.std(blk_mean)/np.sqrt(M-1)], axis=0)
            # estimate stdev of bse using blocks of size 1
            if(n==1):
                  global blk_std
                  blk_std = np.std(blk_mean)/np.sqrt((M-1)/M)
            #print(n,M,tot_frames,np.mean(blk_mean),np.std(blk_mean)/np.sqrt(M-1),np.std(blk_mean)/np.sqrt((M-1)/M))

#print (time)
#print (bse)
#print(blk_std)

# fitting bse fitting function; pass blk_std and trajframes as global variables
def bsefit(t, alpha, tau_1, tau_2):
      #print(blk_std,trajframes)
      return blk_std * np.sqrt(2/trajframes * (  alpha *  (tau_1 * ((np.exp(-t/tau_1) - 1) * tau_1/t + 1)) + 
            (1-alpha) * (tau_2 * ((np.exp(-t/tau_2) - 1) * tau_2/t + 1))))

# estimate fit based on block sizes that yield good statistics
x = time[:1000]
y = bse[:1000]

# curve fit
popt, _ = curve_fit(bsefit, x, y , bounds=([0.0,1,1],[1,20000,20000]), maxfev=5000)
# optimal fitting parameter values
alpha, tau_1, tau_2 = popt

print('stdev             ','alpha             ','tau_1 (ns)       ','tau_2 (ns)     ')
print('-----------------------------------------------------------------------------')
print(blk_std,alpha,time_fact*tau_1,time_fact*tau_2)

# plot input vs output
plt.scatter(time_fact*x, y)
plt.plot(time_fact*x, y)

x_line = np.arange(min(x), max(x), 10)
# calculate the output for the range
y_line = bsefit(x_line, alpha, tau_1, tau_2)

# create a line plot for the mapping function
plt.plot(time_fact*x_line, y_line, '--', color='red')

plt.show()
