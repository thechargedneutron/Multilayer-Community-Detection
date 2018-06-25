clear all
clc

EEG_AUNEW_PAC_cell_normalized = {};
EEG_AUOLD_PAC_cell_normalized = {};
EEG_OC_PAC_cell_normalized = {};

folder_list = [13, 15, 16, 17, 19, 21, 24, 26, 27, 29, 30, 34, 35, 36, 39, 40];

for iii= 1:length(folder_list)
    start = 1
    if exist(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(folder_list(iii)),'\EEG_AUNEW_PAC_normalized.mat')) == 2
        load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(folder_list(iii)),'\EEG_AUNEW_PAC_normalized.mat'));
        EEG_AUNEW_PAC_cell_normalized(iii) = {EEG_supra_pac_AUNEW};
    else
        disp('ERROR finding file')
    end
    
    if exist(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(folder_list(iii)),'\EEG_AUOLD_PAC_normalized.mat')) == 2
        load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(folder_list(iii)),'\EEG_AUOLD_PAC_normalized.mat'));
        EEG_AUOLD_PAC_cell_normalized(iii) = {EEG_supra_pac_AUOLD};
    else
        disp('ERROR finding file')
    end
    
    if exist(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(folder_list(iii)),'\EEG_OC_PAC_normalized.mat')) == 2
        load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(folder_list(iii)),'\EEG_OC_PAC_normalized.mat'));
        EEG_OC_PAC_cell_normalized(iii) = {EEG_supra_pac_OC};
    else
        disp('Error finding file')
    end
    fin = 1
    
end

save(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\EEG_AUNEW_PAC_normalized.mat'), 'EEG_AUNEW_PAC_cell_normalized', '-v7.3');
save(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\EEG_AUOLD_PAC_normalized.mat'), 'EEG_AUOLD_PAC_cell_normalized', '-v7.3');
save(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\EEG_OC_PAC_normalized.mat'), 'EEG_OC_PAC_cell_normalized', '-v7.3');