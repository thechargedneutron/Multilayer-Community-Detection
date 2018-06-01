function [output] = adjacency_matrix(mat1, mat2, flag)
% flag checks if both mat are from same adjacency matrix or not. If they
% are, leading diagonal is 0.
nelectrodes = 62;
output = zeros(nelectrodes);
mat1 = squeeze(mat1);
mat2 = squeeze(mat2);

for i=1:nelectrodes
    for j=1:nelectrodes
        if flag == 0 || i ~= j
                output(i, j) = corr(hilbert_envelope(mat1(i, :))', hilbert_envelope(mat2(j, :))');
        end
    end
end
end