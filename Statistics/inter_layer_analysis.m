function [final1, final2, final3] = inter_layer_analysis(cell1, cell2, cell3)

length1 = length(cell1);
length2 = length(cell2);
length3 = length(cell3);
final1 = zeros(62, length1);
final2 = zeros(62, length2);
final3 = zeros(62, length3);

for i=1:length1
    sub_cell = cell1{i, 1};
    temp = zeros(62, length(sub_cell));
    for j = 1:length(sub_cell)
        temp(:, j) = sub_cell{j};
    end
    
    final1(:, i) = mean(temp, 2);
end

for i=1:length2
    sub_cell = cell2{i, 1};
    temp = zeros(62, length(sub_cell));
    for j = 1:length(sub_cell)
        temp(:, j) = sub_cell{j};
    end
    
    final2(:, i) = mean(temp, 2);
end


for i=1:length3
    sub_cell = cell3{i, 1};
    temp = zeros(62, length(sub_cell));
    for j = 1:length(sub_cell)
        temp(:, j) = sub_cell{j};
    end
    
    final3(:, i) = mean(temp, 2);
end

