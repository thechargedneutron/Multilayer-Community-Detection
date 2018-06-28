clear all
clc

EEG_AUNEW_PAC_cell = {};
EEG_AUOLD_PAC_cell = {};
EEG_OC_PAC_cell = {};

folder_list = [13, 15, 16, 17, 19, 21, 24, 26, 27, 29, 30, 34, 35, 36, 39, 40];
count1 = 1;
count2 = 1;
count3 = 1;

for iii= 1:length(folder_list)
    disp(strcat('Subject',32,num2str(iii)))
    if exist(strcat('D:\Multilayer_Final\',num2str(folder_list(iii)),'\EEG_AUNEW_PAC.mat')) == 2
        load(strcat('D:\Multilayer_Final\',num2str(folder_list(iii)),'\EEG_AUNEW_PAC.mat'));
        EEG_AUNEW_PAC_cell{count1} = EEG_supra_pac_AUNEW;
        count1 = count1 + 1;
    else
        disp('ERROR finding file')
    end
    
    if exist(strcat('D:\Multilayer_Final\',num2str(folder_list(iii)),'\EEG_AUOLD_PAC.mat')) == 2
        load(strcat('D:\Multilayer_Final\',num2str(folder_list(iii)),'\EEG_AUOLD_PAC.mat'));
        EEG_AUOLD_PAC_cell{count2} = EEG_supra_pac_AUOLD;
        count2 = count2 + 1;
    else
        disp('ERROR finding file')
    end
    
    if exist(strcat('D:\Multilayer_Final\',num2str(folder_list(iii)),'\EEG_OC_PAC.mat')) == 2
        load(strcat('D:\Multilayer_Final\',num2str(folder_list(iii)),'\EEG_OC_PAC.mat'));
        EEG_OC_PAC_cell{count3} = EEG_supra_pac_OC;
        count3 = count3 + 1;
    else
        disp('Error finding file')
    end
    disp('Done this subjct')
    
end

save(strcat('D:\Multilayer_Final\EEG_AUNEW_PAC.mat'), 'EEG_AUNEW_PAC_cell', '-v7.3');
save(strcat('D:\Multilayer_Final\EEG_AUOLD_PAC.mat'), 'EEG_AUOLD_PAC_cell', '-v7.3');
save(strcat('D:\Multilayer_Final\EEG_OC_PAC.mat'), 'EEG_OC_PAC_cell', '-v7.3');


%        save(strcat('D:\Multilayer_Final_Final\',num2str(iii),'\EEG_AUNEW_PAC.mat'), 'EEG_supra_pac_AUNEW', '-v7.3');