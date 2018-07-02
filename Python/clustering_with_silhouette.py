import matplotlib.pyplot as plt
import numpy as np
import scipy.io


mat = scipy.io.loadmat('alpha_1_19_AUNEW.mat')
print(mat)
data = mat.get('alpha_1')

print(data.shape)