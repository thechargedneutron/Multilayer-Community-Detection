import matplotlib.pyplot as plt
import scipy.io
import matplotlib.patches as mpatches

from numpy import genfromtxt
my_brain_data = genfromtxt('Brain_Coordinates_Montage-without-label.csv', delimiter=';')

strz = ['theta', 'alpha_1', 'alpha_2', 'beta', 'gamma']
important_nodes = [1, 2, 3]

#### PLOT 1-2
for iter in important_nodes:
	plt.scatter(my_brain_data[iter - 1, 0], my_brain_data[iter - 1, 1], linewidth=4, c = 'r')
img = plt.imread('mne-python\imagee2.jpg')
plt.imshow(img, zorder=0)
plt.title(r"Statistically Significant Nodes "+"\n"+" Intra-Layer Degree "+"\n"+" Segment 2")
plt.axis('off')
red_patch = mpatches.Patch(color='red', label='AUNEW is max')
blue_patch = mpatches.Patch(color='blue', label='AUNEW is min')
plt.legend(handles=[red_patch, blue_patch])
plt.show()
#plt.savefig('intra_layer_2.png', dpi=400, bbox_inches='tight', pad_inches=0)
plt.clf()
plt.cla()
plt.close()

# raise ValueError
# plt.plot([245, 319], [118, 112], 'r-')
# # X1 X2	 		Y1 Y2
# plt.title(r'Hello America $\alpha_1 \beta$')
# plt.axis('off')
# #plt.savefig('data.png', dpi=400, bbox_inches='tight', pad_inches=0)
# plt.show()




#580 -3
#310116024752