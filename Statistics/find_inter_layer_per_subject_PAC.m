function ret = find_inter_layer_per_subject_PAC(EEG_supra_adj)

EEG_supra_adj = EEG_supra_adj(~cellfun('isempty',EEG_supra_adj)); %To remove empty cells
ret = {};

for i = 1:length(EEG_supra_adj)
    subject = EEG_supra_adj{i};
    first_epoch = subject(1:3:end);
    second_epoch = subject(2:3:end);
    third_epoch = subject(3:3:end);
    first = {};
    second = {};
    third = {};
    for j=1:length(first_epoch)
        xx = first_epoch{j};
        mat = find_degree_interlayer(first_epoch{j});
        first{j} = mat;
    end
    
    for j=1:length(second_epoch)
        mat = find_degree_interlayer(second_epoch{j});
        second{j} = mat;
    end
    
    for j=1:length(third_epoch)
        mat = find_degree_interlayer(third_epoch{j});
        third{j} = mat;
    end
    
    ret(i, 1) = {first};
    ret(i, 2) = {second};
    ret(i, 3) = {third};
end

    
    