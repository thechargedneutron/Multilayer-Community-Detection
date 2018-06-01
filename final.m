function output = final(EEG, IAF)

out1 = create_layers(EEG, IAF);
out2 = get_mat_from_data(out1);
output = supra_adjacency_matrix(out2);
end