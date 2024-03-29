function [output, vec1, vec2] = get_value_in_supra_adj_matrix(layer1, layer2, trial, epoch, output_ang, phase_ht_mag_filter)

if layer1(1) > layer2(1)
    min_layer = layer2;
    max_layer = layer1;
else
    min_layer = layer1;
    max_layer = layer2;
end

%output_ang

%All about lower
% min_layer(1)
% size(output_ang)
% trial
mat1 = output_ang{trial, min_layer(1)};
vec1 = mat1(min_layer(2), :);
%All about upper
if min_layer(1) == max_layer(1)
    vec2 = mat1(max_layer(2), :);
else
    cell1 = phase_ht_mag_filter{trial, max_layer(1)};
    mat2 = cell1{min_layer(1)};
    vec2 = mat2(max_layer(2), :);
end


%Taking epoch

if length(vec1) ~= length(vec2)
    disp('FATAL ERROR')
end

vec1 = squeeze(vec1);
vec2 = squeeze(vec2);

if epoch == 1
    output = abs(mean(sign(vec1(1:256) - vec2(1:256))));
end

if epoch == 2
    output = abs(mean(sign(vec1(int16((end-256)/2) + 1 : int16((end+256)/2)) - vec2(int16((end-256)/2) + 1 : int16((end+256)/2)))));
end
if epoch == 3
    output = abs(mean(sign(vec1(end-256+1:end) - vec2(end-256+1:end))));
end

end

