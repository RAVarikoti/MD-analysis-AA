import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
import scipy.stats
import math
import string
import pandas as pd


#for i in range(1):
inp_name = "5-25-50ns-200ns_2.csv"
inp_data = np.loadtxt(inp_name,comments=['#', '@', '&'])[0:24]

#inp_data = pd.read_csv(inp_name,comments=['#', '@', '&'])[0:24]
tau = inp_data[:,1]
print(len(tau))
print(tau)
time   = inp_data[:,0]
#Plot experimental data points
plt.plot(time[:6], tau[:6], label='Expt. data (5 ns)' , color='purple', marker='o', linewidth=0)
plt.plot(time[7:12], tau[7:12], label='Expt. data (25 ns)' , color='green', marker='o', linewidth=0)
plt.plot(time[13:18], tau[13:18], label='Expt. data (50 ns)' , color='cyan', marker='o', linewidth=0)
plt.plot(time[19:24], tau[19:24], label='Expt. data (200 ns)' , color='blue', marker='o', linewidth=0)
# Function to calculate the power-law with constants a and b
def power_lawone(x, b, m):
    return b*np.power(x, m)
popt, pcov = curve_fit(power_lawone, time, tau, maxfev = 1000000)
print(popt)

xFitone = np.arange(5, 205, 5)
print(len(xFitone))
print(xFitone)

plt.plot(xFitone, power_lawone(xFitone, *popt), c='black', lw=2, linestyle='--', label='power law: b=%5.3f, \u03B8=%5.5f,' % tuple(popt))
plt.axis([1,1000, 0.1,100])
plt.loglog()
plt.xlabel('time(ns)')
plt.ylabel('\u03C4*')
plt.title('\u03C4* Vs time(ns) : 6P07-APO')
plt.legend(loc='upper left', ncol = 2, frameon=False)
plt.savefig('5-25-50-200ns-python_2.png')
plt.show()


