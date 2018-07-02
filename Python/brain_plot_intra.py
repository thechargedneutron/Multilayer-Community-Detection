import matplotlib.pyplot as plt
import scipy.io
mat = scipy.io.loadmat('seg_1_node_connections.mat')
data = mat.get('seg_1_sig_node_connections')

from numpy import genfromtxt
my_brain_data = genfromtxt('Brain_Coordinates_Montage-without-label.csv', delimiter=';')

strz = ['theta', 'alpha_1', 'alpha_2', 'beta', 'gamma']

#### PLOT 1-2
for p in range(5):
	for iter in range(data.shape[0]):
		if data[iter, 0] == p+1 and data[iter, 2] == p+1:
			plt.plot([my_brain_data[data[iter, 1] - 1, 0], my_brain_data[data[iter, 3] -1, 0]], [my_brain_data[data[iter, 1] - 1, 1], my_brain_data[data[iter, 3] -1, 1]], 'r-')
	img = plt.imread('mne-python\imagee2.jpg')
	plt.imshow(img, zorder=0)
	plt.title(r'$ \%s - \%s$'%(strz[p], strz[p]))
	plt.axis('off')
	plt.savefig('%s.png'%(p+1), dpi=400, bbox_inches='tight', pad_inches=0)
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