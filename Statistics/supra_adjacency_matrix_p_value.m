function output = supra_adjacency_matrix_p_value(cell1, cell2, cell3)

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

output = zeros(310, 310, 3);

for node_x=1:310
    for node_y = 1:310
        first = squeeze(mat1(node_x, node_y, :, :));
        second = squeeze(mat2(node_x, node_y, :, :));
        third = squeeze(mat3(node_x, node_y, :, :));

        final_mat1 = [first(:, 1)', second(:, 1)', third(:, 1)'];
        final_mat2 = [first(:, 2)', second(:, 2)', third(:, 2)'];
        final_mat3 = [first(:, 3)', second(:, 3)', third(:, 3)'];
        marker = [1*ones(1, length(squeeze(first(:, 1)))), 2*ones(1, length(squeeze(second(:, 1)))), 3*ones(1, length(squeeze(third(:, 1))))];
        output(node_x, node_y, 1) = anova1(final_mat1, marker, 'off');
        output(node_x, node_y, 2) = anova1(final_mat2, marker, 'off');
        output(node_x, node_y, 3) = anova1(final_mat3, marker, 'off');
    end
end
end