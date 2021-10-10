import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
import scipy.stats
import math
import string


acc_cumi1 = np.array([0.0]*14000)

for i in range(1):
	#inp_name = "ACF-COM-D%d.xvg"%i
    inp_name = "ACF-COM-F-average.xvg"

    inp_data = np.loadtxt(inp_name,comments=['#', '@', '&'])[0:14000]

    acc = inp_data[:,1]
    print(len(acc))
    print(acc)
    time   = inp_data[:,0]/250

    #print(time)

    acc_cumi1 += np.array(acc)
    if i==1:
        acc_cumi1 = (acc_cumi1 / 1)
#print(acc_cumi1)  


#Plot experimental data points
plt.plot(time, acc_cumi1, label='Experimental Data' , c='blue')
#plt.show()

####################biexponential#################################
#Fitting function one
def func(t, C0, T1, k, T2):
    return ((C0*np.exp(-(t/T1)**k)) + ((1-C0)*np.exp(-(t/T2))))

param_bounds=([0,-np.inf,0,-np.inf],[1,np.inf,1,np.inf])
#Perform the curve-fit
popt, pcov = curve_fit(func, time, acc_cumi1, maxfev = 1000000, bounds=param_bounds)
print(popt)

#x values for the fitted function
xFit = np.arange(0.0, 56, 0.004)

print(len(xFit))
print(xFit)

#Plot the fitted function
plt.plot(xFit, func(xFit, *popt), c='green', lw=1, label='Stretched Ex: C0=%5.3f, T1=%5.5f,\n k=%5.5f,                         T2=%5.5f' % tuple(popt))

chisq2_one = sum(((acc_cumi1 - func(xFit, *popt)))**2/sum(func(xFit, *popt)))
chisq2_one=np.around(chisq2_one, decimals=8)
print(chisq2_one)
#################################################################
# Write function variable to text files
fileout = open('output_of_function.txt',"a")
C0, T1, k, T2 = popt
fileout.write("F\t56\t")
#fileout.write("time=%g\t" % (len(xFit))*0.002)
fileout.write("%g\t" % (chisq2_one))
fileout.write("%g \t%g \t%g \t%g \n" % tuple(popt))
fileout.close()
#################################################################
#Fitting function two
def func2(t, C0, T1, k, C1, T2):
    return ((C0*np.exp(-(t/T1)**k)) + ((C1)*np.exp(-(t/T2))))

param_bounds=([0,-np.inf,0,0,-np.inf],[1,np.inf,1,1,np.inf])
popt2, pcov2 = curve_fit(func2, time, acc_cumi1, maxfev = 1000000, bounds=param_bounds)
print(popt2)

xFit2 = np.arange(0.0, 56, 0.004)
print(len(xFit2))
print(xFit2)

plt.plot(xFit2, func2(xFit2, *popt2), c='red', lw=1, label='Stretched Ex: C0=%5.3f, T1=%5.5f,\n k=%5.5f,       C1=%5.3f, T2=%5.5f' % tuple(popt2))
#plt.text(15, 0.8, r'mono $\chi^2$')
#plt.show()




#np.savetxt('test.out',(func2(xFit2, *popt2)),fmt='%5.3f,%5.5f,%5.5f,%5.3f,%5.5f' % tuple(popt2))

chisq2_two = sum(((acc_cumi1 - func2(xFit2, *popt2)))**2/sum(func2(xFit2, *popt2)))
chisq2_two=np.around(chisq2_two, decimals=8)
print(chisq2_two)
plt.text(0.03, 1.0, r'time max = 56 ns')


plt.text(0.03, 0.96, r'St. $\chi^2$=',c='green')
plt.text(0.07, 0.96, chisq2_one,c='green')
plt.text(0.03, 0.92, r'C0*exp(-(t/T1)**k) + (1-C0)*exp(-(t/T2))',c='green')

plt.text(0.03, 0.86, r'St. $\chi^2$=',c='red')
plt.text(0.07, 0.86, chisq2_two,c='red')
plt.text(0.03, 0.82, r'C0*exp(-(t/T1)**k) + (C1)*exp(-(t/T2))',c='red')


#plt.text(r"",(1,2))

#plt.text(5, 0.3, r'Bi $\chi^2$=')
plt.xscale('log')
plt.ylim(0,1.1)
plt.legend(frameon=False, loc='lower left')
plt.grid(linestyle = '--', linewidth=1, color='k', alpha = 0.1)
plt.title('Pore Loop Autocorrelation Chain F: 6P07+APO-200ns')
plt.xlabel("Time (ns)")
plt.ylabel("ACF")
#plt.xlim(0.1, 10)
#plt.save('test_acc-A-stex+c.png')
plt.savefig('forcedK/ACFstretchexp+c_chain-F-6P07+APO-200ns-56-nsb.png')

#plt.show()

