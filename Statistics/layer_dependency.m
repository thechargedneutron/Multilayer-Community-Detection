function [output] = layer_dependency(supra_adj)

output = zeros(62, 1);

nlayers = 5;
mat_temp = zeros(62, 5);
di = zeros(62, 1);
%another with 62*5
for layer = 1:nlayers
    mat = supra_adj(62*(layer-1)+1:62*layer, 62*(layer-1)+1:62*layer);
    mat_temp(:, layer) = sum(mat, 1);
    another_mat = supra_adj(62*(layer-1)+1:62*layer, :);
    di = di + sum(another_mat, 2);
end

mat_temp = mat_temp ./ di;

for node = 1:62
    output(node, 1) = sumsqr(mat_temp(node, :));
end

output = 1.25*(1 - output);

end