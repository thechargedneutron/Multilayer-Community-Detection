clear all
clc

for iii=[27, 29, 30, 34, 35, 36, 39, 40]
    start = iii
    load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\IAF.mat'));
    if exist(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUNEW.mat')) == 2
        load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUNEW.mat'));
        load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUNEW_phase_ht.mat'));
        load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUNEW_phase_ht_abs_ht_normalized.mat'));
        EEG_supra_pac_AUNEW = supra_adjacency_matrix_pli(EEG_AUNEW, phase_ht, phase_ht_abs_ht_normalized);
        save(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUNEW_PAC_normalized.mat'), 'EEG_supra_pac_AUNEW', '-v7.3');
        
        completed = 0.33
    end
    
    if exist(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUOLD.mat')) == 2
        load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUOLD.mat'));
        load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUOLD_phase_ht.mat'));
        load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUOLD_phase_ht_abs_ht_normalized.mat'));
        EEG_supra_pac_AUOLD = supra_adjacency_matrix_pli(EEG_AUOLD, phase_ht, phase_ht_abs_ht_normalized);
        save(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUOLD_PAC_normalized.mat'), 'EEG_supra_pac_AUOLD', '-v7.3');
        completed = 0.66
    end
    
    if exist(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_OC.mat')) == 2
        load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_OC.mat'));
        load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_OC_phase_ht.mat'));
        load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_OC_phase_ht_abs_ht_normalized.mat'));
        EEG_supra_pac_OC = supra_adjacency_matrix_pli(EEG_OC, phase_ht, phase_ht_abs_ht_normalized);
        save(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_OC_PAC_normalized.mat'), 'EEG_supra_pac_OC', '-v7.3');
    end
    fin = 1
    
end

%"C:\Users\kumar\Desktop\Ashutosh\Multilayer\13\IAF.mat"