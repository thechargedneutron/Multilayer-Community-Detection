function output = process_before_anova(input_cell)

final = zeros(length(input_cell), 62, 3);
for iter = 1:length(input_cell)
    mat = cell2mat(input_cell(iter));
    mat = mat(63:end, 63:end, :, :);
    
    %62*62*numer_of_points*3
    [~, ~, npoints, ~] = size(mat);
    answer = zeros(62, npoints, 3);
    
    for i=1:npoints
        for j=1:3
            answer(:, i, j) = find_degree_intralayer(squeeze(mat(:, :, i, j)));
        end
    end
    final(iter, :, :) = mean(answer, 2);
end
output = final;
end

    