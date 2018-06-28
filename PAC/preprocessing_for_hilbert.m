function [output_ang, phase_ht_mag_filter] = preprocessing_for_hilbert(EEG_layers, IAF)
%input mat is the output from create_layers
%input is cell of no. of trials * 5

[m, n] = size(EEG_layers);
output_arg = {};
output_ang = {};
mag_filter = {};
phase_ht_mag_filter = {};
for i = 1:m
    for j = 1:n
        temp_arg = zeros(size(EEG_layers{i, j}));
        temp_ang = zeros(size(EEG_layers{i, j}));
        for k=1:62
            temp_arg(k, :) = abs(hilbert(EEG_layers{i, j}(k, :)));
            temp_ang(k, :) = angle(hilbert(EEG_layers{i, j}(k, :)));
        end
        output_arg(i, j) = {temp_arg};
        output_ang(i, j) = {temp_ang};
        mag_filter(i, j) = {create_layers(output_arg(i, j), IAF)};
    end
end

for i = 1:m
    for j = 1:n
        cells = mag_filter{i, j};
        phase_hilbert = {};
        for k=1:length(cells)
            temp1_ang = zeros(size(cells{k}));
            for f = 1:62
                temp1_ang(f, :) = angle(hilbert(cells{k}(f, :)));
            end
            phase_hilbert(k) = {temp1_ang};
        end
        phase_ht_mag_filter(i, j) = {phase_hilbert};
    end
end
end
    