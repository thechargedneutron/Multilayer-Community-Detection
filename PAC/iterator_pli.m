clear all
clc

for iii=[27, 29, 30, 34, 35, 36, 39, 40]
    start = 1
    load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/IAF.mat'));
    if exist(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_AUNEW.mat')) == 2
        load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_AUNEW.mat'));
        load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_AUNEW_phase_ht.mat'));
        load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_AUNEW_phase_ht_abs_ht.mat'));
        EEG_supra_pac_AUNEW = supra_adjacency_matrix_pli(EEG_AUNEW, phase_ht, phase_ht_abs_ht);
        save(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_AUNEW_PAC.mat'), 'EEG_supra_pac_AUNEW', '-v7.3');
        
        completed = 0.33
    end
    
    if exist(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_AUOLD.mat')) == 2
        load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_AUOLD.mat'));
        load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_AUOLD_phase_ht.mat'));
        load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_AUOLD_phase_ht_abs_ht.mat'));
        EEG_supra_pac_AUOLD = supra_adjacency_matrix_pli(EEG_AUOLD, phase_ht, phase_ht_abs_ht);
        save(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_AUOLD_PAC.mat'), 'EEG_supra_pac_AUOLD', '-v7.3');
        completed = 0.66
    end
    
    if exist(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_OC.mat')) == 2
        load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_OC.mat'));
        load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_OC_phase_ht.mat'));
        load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_OC_phase_ht_abs_ht.mat'));
        EEG_supra_pac_OC = supra_adjacency_matrix_pli(EEG_OC, phase_ht, phase_ht_abs_ht);
        save(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(iii),'/EEG_OC_PAC.mat'), 'EEG_supra_pac_OC', '-v7.3');
    end
    fin = 1
    
end