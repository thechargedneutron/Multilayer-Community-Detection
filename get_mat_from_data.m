function [output] = get_mat_from_data(EEG)

[ndataintervals, nfreqbands] = size(EEG);

duration_of_response = zeros(1, ndataintervals);
for foo = 1:ndataintervals
    duration_of_response(1, foo) = size(EEG{foo}, 2);
end

valid_responses = sum(duration_of_response > 3*256);
output = zeros(6, 62, 256, valid_responses, 3);

ind = 1;
for interval = 1:ndataintervals
    for freq =1:nfreqbands
        data = cell2mat(EEG(interval, freq));
        [~, c] = size(data);
        if c >= 3*256
            initial = data(:, 1:256);
            last = data(:, end-256+1:end);
            mid_val = data(:, int16((end-256)/2) + 1:int16((end+256)/2));
            output(freq, :, :, ind, 1) = initial;
            output(freq, :, :, ind, 2) = mid_val;
            output(freq, :, :, ind, 3) = last;
        end
    end
    if size(EEG{interval}, 2) > 3*256
        ind = ind+1;
    end
end
end