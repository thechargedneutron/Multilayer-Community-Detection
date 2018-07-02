import matplotlib.pyplot as plt
import numpy as np
import scipy.io
from numpy import genfromtxt
my_brain_data = genfromtxt('Brain_Coordinates_Montage-without-label.csv', delimiter=';')
colors = ['r-', 'b-']
offset_x = [580, 0]
offset_y = [-3, 0]

for num in [1, 2, 3]:
	mat = scipy.io.loadmat('seg_%d_node_connections.mat'%(num))
	data = mat.get('seg_%d_sig_node_connections'%(num))

	strz = ['', 'theta', 'alpha_1', 'alpha_2', 'beta', 'gamma']

	center = np.array([2, 6, 42, 16, 49, 26, 29, 31])
	left = np.array([1, 33, 34, 4, 37, 5, 38, 59, 9, 41, 10, 14, 44, 15, 45, 61, 20, 48, 21, 24, 51, 25, 52, 63, 55, 56, 30])
	right = np.array([3, 35, 36, 39, 7, 40, 8, 11, 43, 12, 60, 46, 17, 47, 18, 22, 50, 23, 62, 53, 27, 54, 28, 57, 58, 64, 32])
	left = left - (left>13) - (left>19)
	right = right - (right>13) - (right>19)
	center = center - (center>13) - (center>19)

	#### PLOT 1-2
	for p in [1, 2, 3, 4, 5]:
		for q in range(p,6):
			print (p, q)
			cross_connections = 0;
			left_sided = 0;
			right_sided = 0;
			center_to_left = 0;
			center_to_right = 0;
			center_center = 0;
			with open('hemispheric_data_%d.txt'%(num), 'a') as f:
				f.write('For connection %d to %d \n '%(p, q))
			for iter in range(data.shape[0]):
				val = 0
				if data[iter, 0] == p and data[iter, 2] == q:
					if data[iter, 1] in left:
						if data[iter, 3] in left:
							left_sided += 1
						if data[iter, 3] in center:
							center_to_left += 1
						if data[iter, 3] in right:
							cross_connections += 1
							val = 1
					if data[iter, 1] in center:
						if data[iter, 3] in left:
							center_to_left += 1
						if data[iter, 3] in center:
							center_center += 1
						if data[iter, 3] in right:
							center_to_right += 1
					if data[iter, 1] in right:
						if data[iter, 3] in left:
							cross_connections += 1
							val = 1
						if data[iter, 3] in center:
							center_to_right += 1
						if data[iter, 3] in right:
							right_sided += 1
					plt.plot([my_brain_data[data[iter, 1] - 1, 0], my_brain_data[data[iter, 3] -1, 0] + offset_x[p == q]], [my_brain_data[data[iter, 1] - 1, 1], my_brain_data[data[iter, 3] -1, 1] + offset_y[p == q]], colors[val])
			with open('hemispheric_data_%d.txt'%(num), 'a') as f:
				f.write('Cross Connections : %d \n Left Sided: %d \n Right Sided : %d \n Center to Right : %d \n Center to Left : %d \n Center to Center : %d \n'%(cross_connections, left_sided, right_sided, center_to_right, center_to_left, center_center))
			if p ==q:
				img = plt.imread('mne-python\imagee2.jpg')
			else:
				img = plt.imread('mne-python\imagee.jpg')
			plt.imshow(img, zorder=0)
			plt.title(r'$ \%s - \%s$'%(strz[p], strz[q]))
			plt.axis('off')
			plt.savefig('Segment %d/%s-%s.png'%(num, p, q), dpi=400, bbox_inches='tight', pad_inches=0)
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