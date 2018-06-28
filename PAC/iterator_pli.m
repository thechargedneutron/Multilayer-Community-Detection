clear all
clc

for iii=[13, 15, 16, 17, 19, 21, 24, 26]
    disp(strcat('Subject Number',32,num2str(iii)))
    load(strcat('D:\Multilayer_Final\',num2str(iii),'\IAF.mat'));
    if exist(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUNEW.mat')) == 2
        load(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUNEW.mat'));
        load(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUNEW_phase_ht.mat'));
        load(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUNEW_phase_ht_abs_ht.mat'));
        EEG_supra_pac_AUNEW = supra_adjacency_matrix_pli(EEG_AUNEW, phase_ht, phase_ht_abs_ht_normalized);
        save(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUNEW_PAC.mat'), 'EEG_supra_pac_AUNEW', '-v7.3');
        
       disp('0.33 completed')
    end
    
    if exist(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUOLD.mat')) == 2
        load(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUOLD.mat'));
        load(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUOLD_phase_ht.mat'));
        load(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUOLD_phase_ht_abs_ht.mat'));
        EEG_supra_pac_AUOLD = supra_adjacency_matrix_pli(EEG_AUOLD, phase_ht, phase_ht_abs_ht_normalized);
        save(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUOLD_PAC.mat'), 'EEG_supra_pac_AUOLD', '-v7.3');
        disp('0.66 completed')
    end
    
    if exist(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_OC.mat')) == 2
        load(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_OC.mat'));
        load(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_OC_phase_ht.mat'));
        load(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_OC_phase_ht_abs_ht.mat'));
        EEG_supra_pac_OC = supra_adjacency_matrix_pli(EEG_OC, phase_ht, phase_ht_abs_ht_normalized);
        save(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_OC_PAC.mat'), 'EEG_supra_pac_OC', '-v7.3');
    end
    disp('1.0 completed')
    
end

%"D:\Multilayer_Final\13\IAF.mat"
%"D:\Multilayer_Final_Final\13\EEG_AUNEW.mat"