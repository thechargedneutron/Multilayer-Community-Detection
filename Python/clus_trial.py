# -*- coding: utf-8 -*-
"""
Created on Wed Jun 20 15:33:51 2018

@author: Ashu
"""

import numpy as np
import networkx as nx
from sklearn.cluster import SpectralClustering
from sklearn import metrics
np.random.seed(1)

# Get your mentioned graph

# Get ground-truth: club-labels -> transform to 0/1 np-array
#     (possible overcomplicated networkx usage here)

# Get adjacency-matrix as numpy-array
adj_mat = 0.5*np.random.random_sample((62, 62))

# Cluster
sc = SpectralClustering(7, affinity='precomputed')
print("Hii")
sc.fit(adj_mat)
print("Hello")

def check_symmetry(a, tol=1e-8):
    return np.allclose(a, a.T, atol=tol)

print(check_symmetry(adj_mat))
# Compare ground-truth and clustering-results
print('spectral clustering')
print(sc.labels_)

# Calculate some clustering metrics
#print(metrics.adjusted_rand_score(gt, sc.labels_))
#print(metrics.adjusted_mutual_info_score(gt, sc.labels_))