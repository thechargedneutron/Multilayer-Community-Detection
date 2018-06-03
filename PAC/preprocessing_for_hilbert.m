function [output_ang, phase_ht_mag_filter] = preprocessing_for_hilbert(EEG_layers, IAF)
%input mat is the output from create_layers
%input is cell of no. of trials * 6

[m, n] = size(EEG_layers);
output_arg = {};
output_ang = {};
mag_filter = {};
phase_ht_mag_filter = {};
for i = 1:m
    for j = 1:n
        output_arg(i, j) = {abs(hilbert(EEG_layers{i, j}))};
        output_ang(i, j) = {angle(hilbert(EEG_layers{i, j}))};
        mag_filter(i, j) = {create_layers(output_arg(i, j), IAF)};
    end
end

for i = 1:m
    for j = 1:n
        cells = mag_filter{i, j};
        phase_hilbert = {};
        for k=1:length(cells)
            phase_hilbert(k) = {angle(hilbert(cells{k}))};
        end
        phase_ht_mag_filter(i, j) = {phase_hilbert};
    end
end
end
    