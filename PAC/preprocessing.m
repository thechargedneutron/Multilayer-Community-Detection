clear all
clc

for iii=[36, 40]
    disp(strcat('Subject Number',32,num2str(iii)))
    load(strcat('D:\Multilayer_Final\',num2str(iii),'\IAF.mat'));
    if exist(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUNEW.mat')) == 2
        load(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUNEW.mat'));
        out1 = create_layers(EEG_AUNEW, IAF);
        [phase_ht, phase_ht_abs_ht_normalized] = preprocessing_for_hilbert(out1, IAF);
        save(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUNEW_phase_ht.mat'), 'phase_ht');
        save(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUNEW_phase_ht_abs_ht.mat'), 'phase_ht_abs_ht_normalized', '-v7.3');
        disp('0.33 done')
    end
    
    if exist(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUOLD.mat')) == 2
        load(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUOLD.mat'));
        out1 = create_layers(EEG_AUOLD, IAF);
        [phase_ht, phase_ht_abs_ht_normalized] = preprocessing_for_hilbert(out1, IAF);
        save(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUOLD_phase_ht.mat'), 'phase_ht');
        save(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_AUOLD_phase_ht_abs_ht.mat'), 'phase_ht_abs_ht_normalized', '-v7.3');
        disp('0.66 done')
    end
    
    if exist(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_OC.mat')) == 2
        load(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_OC.mat'));
        out1 = create_layers(EEG_OC, IAF);
        [phase_ht, phase_ht_abs_ht_normalized] = preprocessing_for_hilbert(out1, IAF);
        save(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_OC_phase_ht.mat'), 'phase_ht');
        save(strcat('D:\Multilayer_Final\',num2str(iii),'\EEG_OC_phase_ht_abs_ht.mat'), 'phase_ht_abs_ht_normalized', '-v7.3');
    end
    fin = 1
    
end