function output = get_p_value(input_cell)

final = zeros(length(input_cell), 62, 3);
for iter = 1:length(input_cell)
    mat = cell2mat(input_cell(iter));
    mat = mat(63:end, 63:end, :, :);
    
    %62*62*numer_of_points*3
    [~, ~, npoints, ~] = size(mat);
    answer = zeros(62, npoints, 3);
    
    for i=1:npoints
        for j=1:3
            answer(:, i, j) = find_degree_interlayer(squeeze(mat(:, :, i, j)));
        end
    end
    final(iter, :, :) = mean(answer, 2);
end

output = zeros(62, 3);
for k=1:62
    for m=1:3
        output(k, m) = anova1(squeeze(final(:, k, m)));
    end
end
    