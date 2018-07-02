function op = inter_layer_correlation(supra_adj_matrix)

op = zeros(5,5);

for i=1:5
    for j=1:5
        op(i, j) = corr2(supra_adj_matrix(62*(i-1)+1:62*i, 62*(j-1) + 1:62*j), supra_adj_matrix(62*(j-1)+1:62*j, 62*(j-1) + 1:62*j));
    end
end
end