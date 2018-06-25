%input to be taken as per requirement
%input should be the matrix at the beginning that is, the original nuber of
%trials * 1 data 

function final = supra_adjacency_matrix_pli(input, output_ang, phase_ht_mag_filter)

final = {};
epochs = 3;
% size(output_ang)
% output_ang
for epoch=1:epochs
    for trial=1:length(input)
        [~, col] = size(input{trial});
        if col >= 3*256
            mat = zeros(372, 372);
            for i=1:372
                for j=i+1:372
                    tempx = get_value_in_supra_adj_matrix([ceil(i/62), rem(i-1, 62) + 1], [ceil(j/62), rem(j-1, 62) + 1], trial, epoch, output_ang, phase_ht_mag_filter);
                    mat(i, j) = tempx;
                    mat(j, i) = tempx;
                end
            end
            final(epoch, trial) = {mat};
        end
    end
end
final = final(~cellfun('isempty', final));
end
