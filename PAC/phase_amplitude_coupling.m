function output = phase_amplitude_coupling(signal_lf, signal_hf, lower_range, fs)
disp('Entering pac')
%fs = Sampling Rate

z_lf = hilbert(signal_lf);
z_hf = hilbert(signal_hf);

A_hf = abs(z_hf);

phi_lf = angle(z_lf);
disp('Start filtering')

A_hf_lf = fir_filtering(A_hf, 1, fs, lower_range(1), lower_range(2));

disp('End filtering')

z_hf_lf = hilbert(A_hf_lf);

phi_hf_lf = angle(z_hf_lf);

output = mean(sign(phi_lf - phi_hf_lf));
disp('Exiting pac')

end


