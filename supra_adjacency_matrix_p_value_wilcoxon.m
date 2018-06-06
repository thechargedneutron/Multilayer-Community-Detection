function output = supra_adjacency_matrix_p_value_wilcoxon(cell1, cell2, cell3)

mat1 = zeros(372, 372, length(cell1), 3);
mat2 = zeros(372, 372, length(cell2), 3);
mat3 = zeros(372, 372, length(cell3), 3);

for i=1:length(cell1)
    mat = cell2mat(cell1(i));
    mat1(:, :, i, :) = squeeze(mean(mat, 3));
end
mat1 = mat1(63:end, 63:end, :, :);

for i=1:length(cell2)
    mat = cell2mat(cell2(i));
    mat2(:, :, i, :) = squeeze(mean(mat, 3));
end
mat2 = mat2(63:end, 63:end, :, :);

for i=1:length(cell3)
    mat = cell2mat(cell3(i));
    mat3(:, :, i, :) = squeeze(mean(mat, 3));
end
mat3 = mat3(63:end, 63:end, :, :);

output = zeros(310, 310, 3, 3);

for node_x=1:310
    for node_y = 1:310
        first = squeeze(mat1(node_x, node_y, :, :));
        second = squeeze(mat2(node_x, node_y, :, :));
        third = squeeze(mat3(node_x, node_y, :, :));
        output(node_x, node_y, 1, 1) = ranksum(first(:, 1), second(:, 1), 'off');
        output(node_x, node_y, 1, 2) = ranksum(second(:, 1), third(:, 1), 'off');
        output(node_x, node_y, 1, 3) = ranksum(third(:, 1), first(:, 1), 'off');
        output(node_x, node_y, 2, 1) = ranksum(first(:, 2), second(:, 2), 'off');
        output(node_x, node_y, 2, 2) = ranksum(second(:, 2), third(:, 2), 'off');
        output(node_x, node_y, 2, 3) = ranksum(third(:, 2), first(:, 2), 'off');
        output(node_x, node_y, 3, 1) = ranksum(first(:, 3), second(:, 3), 'off');
        output(node_x, node_y, 3, 2) = ranksum(second(:, 3), third(:, 3), 'off');
        output(node_x, node_y, 3, 3) = ranksum(third(:, 3), first(:, 3), 'off');
    end
end
end