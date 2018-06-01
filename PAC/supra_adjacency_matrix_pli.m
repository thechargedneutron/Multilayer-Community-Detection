function output = supra_adjacency_matrix_pli(input, IAF)
disp('Entering supra_adjacency matrix')
%All the layers are 1x1 cells in the order apha, beta, ...
[nfreqbands, nelectrodes, ~, nintervals, npartitions] = size(input);

output = zeros(nfreqbands*nelectrodes, nfreqbands*nelectrodes, nintervals, npartitions); % 6*62 = 372

for i=1:nfreqbands
    for j = 1:nfreqbands
        for l=1:npartitions
            for m=1:nintervals
                tem = get_frequency_bands(IAF);
                output(62*(i-1)+1:62*i, 62*(j-1)+1:62*j, m,l) = adjacency_matrix_pli(input(i, :, :, m, l), input(j, :, :, m, l), double(i==j), tem(min(i, j), :));
            end
        end
    end
end
disp('Exiting supra adjacency matrix')
end
