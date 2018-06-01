function [output] = adjacency_matrix_pli(mat1, mat2, flag, low_cutoff)
% flag checks if both mat are from same adjacency matrix or not. If they
% are, leading diagonal is 0.
fs = 256;
nelectrodes = 62;
output = zeros(nelectrodes);
mat1 = squeeze(mat1);
mat2 = squeeze(mat2);

for i=1:nelectrodes
    for j=1:nelectrodes
        if flag == 0 || i ~= j
                output(i, j) = phase_amplitude_coupling(mat1(i, :), mat2(j, :), low_cutoff, fs);
        end
    end
end
end