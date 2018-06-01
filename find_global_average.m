function output = find_global_average(cell)
sum = 0;
for b = 1:length(cell)
    [~, ~, c, ~] = size(cell(b));
    sum = sum + c;
end


%answer = zeros(372, 372, 3);
aggregate = zeros(372, 372, sum, 3);
x = 1;
for b = 1:length(cell)
    mat = cell2mat(cell(b));
    [~, ~, m, ~] = size(mat);
    for c = 1:m
        aggregate(:, :, x, :) = mat(:, :, c, :);
        x = x+1;
    end
end

output = squeeze(mean(aggregate, 3));
end

    
    