function data_new = fir_filtering(signal, N_chan, fs, left, right)

% fs = 400; % sampling frequency

% left = 4; % Hz
% right = 15;

% left_1 = left / (fs / 2);
% right_1 = right / (fs / 2);
signal=double(signal);
data_new = zeros(size(signal));
for ch = 1:N_chan
%     h = fir1(10, [left_1, right_1], 'bandpass'); % 6: filter order
%     assignin('base', 'h', h)
% % %     [bb,aa]=butter(6,[left right]/125);
% % %      y = filtfilt(bb,aa,signal(ch,:));

            data_new(ch,:)=bp_filter(signal(ch,:),left,right,fs);
    % h = fir1(6, [left_1, right_1], 'high'); % 6: filter order
    % h = fir1(6, [left_1, right_1], 'low'); % 6: filter order
%     y = filter(h, 1, signal(ch, :)); % x: input data; y: filtered data
    
%     data_new(ch, :) = y;
end

end