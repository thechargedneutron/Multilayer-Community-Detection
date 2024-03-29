%input to be taken as per requirement
%input should be the matrix at the beginning that is, the original nuber of
%trials * 1 data 

function final = supra_adjacency_matrix_pli(input, output_ang, phase_ht_mag_filter)

final = {};
epochs = 3;
% size(output_ang)
% output_ang
for trial=1:length(input)
    temporary_cell = {};
    [~, col] = size(input{trial});
    if col >= 3*256
        for epoch=1:epochs
            mat = zeros(310, 310);
            for i=1:310
                for j=i+1:310
                    tempx = get_value_in_supra_adj_matrix([ceil(i/62), rem(i-1, 62) + 1], [ceil(j/62), rem(j-1, 62) + 1], trial, epoch, output_ang, phase_ht_mag_filter);
                    mat(i, j) = tempx;
                    mat(j, i) = tempx;
                end
            end
            %final(epoch, trial) = {mat};
            temporary_cell{epoch} = mat;
        end
    end
    if ~ isempty(temporary_cell)
        final{trial} = temporary_cell;
end
final = final(~cellfun('isempty', final));
end
