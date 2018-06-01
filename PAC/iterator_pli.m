clear all
clc

for iii=[27, 29, 30, 34, 35, 36, 39, 40]
    start = 1
    load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/IAF.mat'));
    if exist(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_AUNEW.mat')) == 2
        load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_AUNEW.mat'));
        EEG_AUNEW_revised_pli = final_pli(EEG_AUNEW, IAF);
        save(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_AUNEW_revised_pli.mat'), 'EEG_AUNEW_revised_pli');
        completed = 0.33
    end
    
    if exist(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_AUOLD.mat')) == 2
        load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_AUOLD.mat'));
        EEG_AUOLD_revised_pli = final_pli(EEG_AUOLD, IAF);
        save(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_AUOLD_revised_pli.mat'), 'EEG_AUOLD_revised_pli');
        completed = 0.66
    end
    
    if exist(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_OC.mat')) == 2
        load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_OC.mat'));
        EEG_OC_revised = final_pli(EEG_OC, IAF);
        save(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_OC_revised.mat'), 'EEG_OC_revised');
    end
    fin = 1
    
end