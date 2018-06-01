clear all
clc


OC_cell = {};
AUNEW_cell = {};
AUOLD_cell = {};
directory = [13, 15, 16, 17, 19, 21, 24, 26, 27, 29, 30, 34, 35, 36, 39, 40];
for iii = 1:length(directory)
    name = directory(iii);
    
    if exist(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(name),'/EEG_AUNEW_revised.mat')) == 2
        load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(name),'/EEG_AUNEW_revised.mat'));
        AUNEW_cell{iii} = EEG_AUNEW_revised;
    end
    load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(name),'/EEG_AUOLD_revised.mat'));
    load(strcat('/home/ashutosh/Desktop/Multilayer/',num2str(name),'/EEG_OC_revised.mat'));
    
    
    AUOLD_cell{iii} = EEG_AUOLD_revised;
    OC_cell{iii} = EEG_OC_revised;
end

save('/home/ashutosh/Desktop/Multilayer/EEG_AUNEW_revised.mat', 'AUNEW_cell', '-v7.3');
save('/home/ashutosh/Desktop/Multilayer/EEG_AUOLD_revised.mat', 'AUOLD_cell', '-v7.3');
save('/home/ashutosh/Desktop/Multilayer/EEG_OC_revised.mat', 'OC_cell', '-v7.3');



