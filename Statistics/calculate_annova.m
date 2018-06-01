function output = calculate_annova(cell1, cell2, cell3)

mat1 = process_before_anova(cell1);
mat2 = process_before_anova(cell2);
mat3 = process_before_anova(cell3);

output = zeros(62, 3);

for node=1:62
    first = squeeze(mat1(:, node, :));
    second = squeeze(mat2(:, node, :));
    third = squeeze(mat3(:, node, :));
    
    final_mat1 = [first(:, 1)', second(:, 1)', third(:, 1)'];
    final_mat2 = [first(:, 2)', second(:, 2)', third(:, 2)'];
    final_mat3 = [first(:, 3)', second(:, 3)', third(:, 3)'];
    marker = [1*ones(1, length(squeeze(first(:, 1)))), 2*ones(1, length(squeeze(second(:, 1)))), 3*ones(1, length(squeeze(third(:, 1))))];
    output(node, 1) = anova1(final_mat1, marker, 'off');
    output(node, 2) = anova1(final_mat2, marker, 'off');
    output(node, 3) = anova1(final_mat3, marker, 'off');
end
end