clear all
clc

for iii=[13, 15, 16, 17, 19, 21, 24, 26, 27, 29, 30, 34, 35, 36, 39, 40]
    start = 1
     load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\IAF.mat'));
    if exist(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUNEW.mat')) == 2
        load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUNEW.mat'));
        out1 = create_layers(EEG_AUNEW, IAF);
        [phase_ht, phase_ht_abs_ht] = preprocessing_for_hilbert(out1, IAF);
        save(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUNEW_phase_ht.mat'), 'phase_ht');
        save(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUNEW_phase_ht_abs_ht.mat'), 'phase_ht_abs_ht', '-v7.3');
        completed = 0.33
    end
    
    if exist(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUOLD.mat')) == 2
        load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUOLD.mat'));
        out1 = create_layers(EEG_AUOLD, IAF);
        [phase_ht, phase_ht_abs_ht] = preprocessing_for_hilbert(out1, IAF);
        save(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUOLD_phase_ht.mat'), 'phase_ht');
        save(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUOLD_phase_ht_abs_ht.mat'), 'phase_ht_abs_ht', '-v7.3');
        completed = 0.66
    end
    
    if exist(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_OC.mat')) == 2
        load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_OC.mat'));
        out1 = create_layers(EEG_OC, IAF);
        [phase_ht, phase_ht_abs_ht] = preprocessing_for_hilbert(out1, IAF);
        save(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_OC_phase_ht.mat'), 'phase_ht');
        save(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_OC_phase_ht_abs_ht.mat'), 'phase_ht_abs_ht', '-v7.3');
    end
    fin = 1
    
end