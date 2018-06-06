clear all
clc

EEG_AUNEW_PAC_cell = {};
EEG_AUOLD_PAC_cell = {};
EEG_OC_PAC_cell = {};

folder_list = [13, 15, 16, 17, 19, 21, 24, 26, 27, 29, 30, 34, 35, 36, 39, 40];

for iii= 1:length(folder_list)
    start = 1
    if exist(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(folder_list(iii)),'/EEG_AUNEW_PAC.mat')) == 2
        load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(folder_list(iii)),'/EEG_AUNEW_PAC.mat'));
        EEG_AUNEW_PAC_cell(iii) = {EEG_supra_pac_AUNEW};
        completed = 0.33
    end
    
    if exist(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(folder_list(iii)),'/EEG_AUOLD_PAC.mat')) == 2
        load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(folder_list(iii)),'/EEG_AUOLD_PAC.mat'));
        EEG_AUOLD_PAC_cell(iii) = {EEG_supra_pac_AUOLD};
        completed = 0.66
    end
    
    if exist(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(folder_list(iii)),'/EEG_OC_PAC.mat')) == 2
        load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(folder_list(iii)),'/EEG_OC_PAC.mat'));
        EEG_OC_PAC_cell(iii) = {EEG_supra_pac_OC};
    end
    fin = 1
    
end

save(strcat('/home/ashutosh/Desktop/Multilayer/EEG_AUNEW_PAC_cell.mat'), 'EEG_AUNEW_PAC_cell', '-v7.3');
save(strcat('/home/ashutosh/Desktop/Multilayer/EEG_AUOLD_PAC.mat'), 'EEG_AUOLD_PAC_cell', '-v7.3');
save(strcat('/home/ashutosh/Desktop/Multilayer/EEG_OC_PAC.mat'), 'EEG_OC_PAC_cell', '-v7.3');