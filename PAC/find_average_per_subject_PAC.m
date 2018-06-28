function mat = find_average_per_subject_PAC(EEG_supra_adj)

EEG_supra_adj = EEG_supra_adj(~cellfun('isempty',EEG_supra_adj)); %To remove empty cells

mat = zeros(310, 310, length(EEG_supra_adj), 3);

for i = 1:length(EEG_supra_adj)
    
    temp = EEG_supra_adj{i};
    
    aggregated = zeros(310, 310, length(temp), 3);
    
    for j = 1:length(temp)
        for k=1:3
            aggregated(:, :, j, k) = temp{1, j}{1, k};
        end
    end
    
    temp_agg = squeeze(mean(aggregated, 3));
    for k=1:3
        mat(:, :, i, k) = temp_agg(:, :, k);
    end
end

    
% %     first_epoch = temp(1:3:end);
% %     second_epoch = temp(2:3:end);
% %     third_epoch = temp(3:3:end);
% %     
% %     temp1 = zeros(length(first_epoch), 372, 372);
% %     temp2 = zeros(length(second_epoch), 372, 372);
% %     temp3 = zeros(length(third_epoch), 372, 372);
% %     
% %     for j = 1:length(first_epoch)
% %         temp1(j, :, :) = first_epoch{j};
% %         temp2(j, :, :) = second_epoch{j};
%         temp3(j, :, :) = third_epoch{j};
%     end
%     mat(:, :, i, 1) = mean(temp1, 1);
%     mat(:, :, i, 2) = mean(temp2, 1);
%     mat(:, :, i, 3) = mean(temp3, 1);
% end
% end


