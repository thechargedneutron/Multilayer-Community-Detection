function output = create_layers(EEG_data, IAF)
[n_points, ~] = size(EEG_data);

%filtering values
%We use the order delta, theta, alpha_low, alpha_high, beta, gamma
lows_and_highs = get_frequency_bands(IAF);
output = cell(n_points, 5);

for data_index =1:n_points
    mat = EEG_data{data_index, :};
    for k=1:5
        temp_cell = fir_filtering(mat, 62, 256, lows_and_highs(k,1), lows_and_highs(k,2));
        output(data_index, k) = mat2cell(temp_cell, 62);
    end
end
end