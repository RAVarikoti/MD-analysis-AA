import matplotlib.pyplot as plt
import scipy.ndimage
import numpy as np
from scipy.ndimage.filters import gaussian_filter

###########################This is the setup###################################
def setup(label_font=12, font_weight=700, tick_font=12, axis_width=1.5, 
    tick_major_width=2, tick_minor_width=1.5, 
    tick_major_size=5, tick_minor_size=2, 
    showmajorticks=True, showminorticks=True):
    from matplotlib import rcParams
    # Conversion of unicode minus sign
    rcParams['axes.unicode_minus']=False
    # canvas setup
    rcParams['axes.labelsize']=label_font
    rcParams['axes.linewidth']=axis_width
    rcParams['axes.labelweight']=font_weight
    # x ticks setup
    rcParams['xtick.labelsize']=tick_font
    rcParams['xtick.direction']='in'
    rcParams['xtick.top']=True
    rcParams['xtick.minor.visible']=showminorticks
    rcParams['xtick.major.width']=tick_major_width
    rcParams['xtick.major.size']=tick_major_size if showmajorticks else 0
    rcParams['xtick.minor.top']=True
    rcParams['xtick.minor.width']=tick_minor_width
    rcParams['xtick.minor.size']=tick_minor_size
    # y ticks setup
    rcParams['ytick.labelsize']=tick_font
    rcParams['ytick.direction']='in'
    rcParams['ytick.right']=True
    rcParams['ytick.minor.visible']=showminorticks
    rcParams['ytick.major.width']=tick_major_width
    rcParams['ytick.major.size']=tick_major_size if showmajorticks else 0
    rcParams['ytick.minor.right']=True
    rcParams['ytick.minor.width']=tick_minor_width
    rcParams['ytick.minor.size']=tick_minor_size
    # font family
    rcParams['font.family'] = 'Times New Roman'
    rcParams['font.weight'] = font_weight
    rcParams['font.sans-serif'] = ['Times New Roman']
    rcParams['mathtext.fontset'] = 'cm'

def label(axs, case='upper', xratio=0.005, yratio=0.85, fontsize=10):
    import numpy as np
    import sys
    if type(axs) is not np.ndarray:
        sys.stdout.write("Label setup ignored: Axs type is not np.ndarray.\n")
        return
    import string
    if 'upper'==case:
        labels = string.ascii_uppercase
    if 'lower'==case:
        labels = string.ascii_lowercase
    for i, ax in enumerate(axs.flatten()):
        ax.text(xratio, yratio, "(%s)"%labels[i], transform=ax.transAxes, size=fontsize)

def save(img_name, dpi=100, width=0, height=0):
    from matplotlib import pyplot
    if 0==width or 0==height:
        width, height = pyplot.gcf().get_size_inches()
    pyplot.gcf().set_size_inches(width, height)
    pyplot.savefig(img_name+'.png', dpi=dpi, bbox_inches='tight')

def save3(img_name, dpi=100, width=0, height=0):
    from matplotlib import pyplot
    if 0==width or 0==height:
        width, height = pyplot.gcf().get_size_inches()
    pyplot.gcf().set_size_inches(width, height)
    pyplot.savefig(img_name+'.png', dpi=dpi, bbox_inches='tight')
    pyplot.savefig(img_name+'.pdf', dpi=dpi, bbox_inches='tight')
    pyplot.savefig(img_name+'.svg', dpi=dpi, bbox_inches='tight')
if __name__ == "__main__":
	
	setup() 
############################End of the setup############################################   
	data = np.genfromtxt("FEL-hex_pc12.dat")
	print (data.shape)
	print(min(data[:,2]))
	print(max(data[:,2]))
	print (data.shape)
	x = data[:,0].reshape(32,-1)
	x = gaussian_filter(x, sigma=.7)
	#x = scipy.ndimage.zoom(x, 2)
	y = data[:,1].reshape(32,-1)
	y = gaussian_filter(y, sigma=.7)
	#y = scipy.ndimage.zoom(y, 2)
	z = data[:,2].reshape(32,-1)
	z = gaussian_filter(z, sigma=.7)
	#z = scipy.ndimage.zoom(z, 2)
	z = np.ma.masked_where(z >= 16, z)

	#plt.contour(x,y,z, colors='k')
	#plt.contourf(x,y,z,9, vmin = 0., vmax = 2, cmap='jet')
	plt.contourf(x,y,z, 10, cmap='jet')
	m = plt.cm.ScalarMappable(cmap='jet')
	plt.grid(which='major',linestyle = '--', linewidth=1, color='k', alpha = 0.3)
	#plt.grid(which='minor',linestyle = '--', linewidth=1, color='k', alpha = 0.15)
	plt.xlabel('PC1')
	plt.ylabel('PC2')
	#plt.xlim(-15, 15)
	#plt.ylim(-15, 15)
	#plt.clim(0.0,14)
	plt.colorbar(m, boundaries=np.linspace(0, 2, 9))
	plt.title("6P07-APO")
	save("6P07-APO_pc12_222")
	plt.close()

