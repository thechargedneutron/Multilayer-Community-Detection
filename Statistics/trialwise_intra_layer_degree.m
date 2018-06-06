function output = trialwise_intra_layer_degree(EEG_supra_adj)

EEG_supra_adj = EEG_supra_adj(~cellfun('isempty',EEG_supra_adj)); %To remove empty cells

count = 0;
for i = 1:length(EEG_supra_adj)
    temp = EEG_supra_adj{i};
    count = count + length(temp);
end

output = zeros(62, count, 3);
iter = 1;

for i = 1:length(EEG_supra_adj)
    
    temp = EEG_supra_adj{i};
    
    first_epoch = temp(1:3:end);
    second_epoch = temp(2:3:end);
    third_epoch = temp(3:3:end);
    
    for j = 1:length(first_epoch)
        ans_1 = find_degree_intralayer(first_epoch{j});
        ans_2 = find_degree_intralayer(second_epoch{j});
        ans_3 = find_degree_intralayer(third_epoch{j});
        output(:, iter, 1) = ans_1;
        output(:, iter, 2) = ans_2;
        output(:, iter, 3) = ans_3;
        iter = iter+1;
    end
end
end