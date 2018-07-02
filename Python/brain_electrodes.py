import matplotlib.pyplot as plt
import scipy.io

from numpy import genfromtxt
my_brain_data = genfromtxt('Brain_Coordinates_Montage-without-label.csv', delimiter=';')

strz = ['theta', 'alpha_1', 'alpha_2', 'beta', 'gamma']
important_nodes_AUNEW_min = []
important_nodes_AUNEW_max = [5, 20, 32, 47]


#### PLOT 1-2
for iter in important_nodes_AUNEW_min:
	plt.scatter(my_brain_data[iter - 1, 0], my_brain_data[iter - 1, 1], linewidth=4, c = 'r')
for iter2 in important_nodes_AUNEW_max:
	plt.scatter(my_brain_data[iter2 - 1, 0], my_brain_data[iter2 - 1, 1], linewidth=4, c = 'g')
img = plt.imread('imagee2.jpg')
plt.imshow(img, zorder=0)
plt.title(r"Statistically Significant Nodes "+"\n"+" Intra-Layer Degree "+"\n"+" Segment 3")
plt.axis('off')
plt.show()
#plt.savefig('D:\Multilayer_Final\Significant_Metrics\Intra_Layer\Seg_3.png', dpi=400, bbox_inches='tight', pad_inches=0)
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