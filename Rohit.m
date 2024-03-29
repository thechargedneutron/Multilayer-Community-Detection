clear all
clc
count=1;
for iii=[13,16:17,19,21,24,26,27,29,30,34,35,39,40]
iii
     load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\IAF.mat'));
     load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUNEW.mat'));
     load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_AUOLD.mat'));
     load(strcat('C:\Users\kumar\Desktop\Ashutosh\Multilayer\',num2str(iii),'\EEG_OC.mat'));
     
     pos=1;
     for i=1:size(EEG_AUNEW,1)
         if(size(EEG_AUNEW{i,1},2)>768)
         for j=1:62
             data_filtered_AUNEW{count,1}{pos,1}(j,:)=bp_filter(double(EEG_AUNEW{i,1}(j,:)),IAF-2,IAF,256);
             pos=pos+1;
         end
         end
     end
     
     %Calculating PLI
     
     for i=1:size(data_filtered_AUNEW,1)
         data_PLI_AUNEW{count,1}{i,1}=PLI_Cal1(data_filtered_AUNEW{count,1}{i,1}(:,1:256));
     end
     
     pos=1;
     for i=1:size(EEG_AUOLD,1)
         if(size(EEG_AUOLD{i,1},2)>768)
         for j=1:62
             data_filtered_AUOLD{count,1}{pos,1}(j,:)=bp_filter(double(EEG_AUOLD{i,1}(j,:)),IAF-2,IAF,256);
             pos=pos+1;
         end
         end
     end
     
     %Calculating PLI
     
     for i=1:size(data_filtered_AUOLD,1)
         data_PLI_AUOLD{count,1}{i,1}=PLI_Cal1(data_filtered_AUOLD{count,1}{i,1}(:,1:256));
     end
     
     pos=1;
     for i=1:size(EEG_OC,1)
         if(size(EEG_OC{i,1},2)>768)
         for j=1:62
             data_filtered_OC{count,1}{pos,1}(j,:)=bp_filter(double(EEG_OC{i,1}(j,:)),IAF-2,IAF,256);
             pos=pos+1;
         end
         end
     end
     
     %Calculating PLI
     
     for i=1:size(data_filtered_OC,1)
         data_PLI_OC{count,1}{i,1}=PLI_Cal1(data_filtered_OC{count,1}{i,1}(:,1:256));
     end
     count=count+1;
end

sum=zeros(62,62);
for i=1:14
    for j=1:size(data_PLI_AUNEW{i,1},1)
        sum=sum+data_PLI_AUNEW{i,1}{j,1};
    end
    mean_PLI_AUNEW{i,1}=sum/size(data_PLI_AUNEW{i,1},1);
    sum=zeros(62,62);
end

sum=zeros(62,62);
for i=1:14
    for j=1:size(data_PLI_AUOLD{i,1},1)
        sum=sum+data_PLI_AUOLD{i,1}{j,1};
    end
    mean_PLI_AUOLD{i,1}=sum/size(data_PLI_AUOLD{i,1},1);
    sum=zeros(62,62);
end

sum=zeros(62,62);
for i=1:14
    for j=1:size(data_PLI_OC{i,1},1)
        sum=sum+data_PLI_OC{i,1}{j,1};
    end
    mean_PLI_OC{i,1}=sum/size(data_PLI_OC{i,1},1);
    sum=zeros(62,62);
end

sum=zeros(62,62);

for i=1:14
    sum=sum+mean_PLI_AUNEW{i,1};
end

mean_PLI1_AUNEW=sum/14;

sum=zeros(62,62);

for i=1:14
    sum=sum+mean_PLI_AUOLD{i,1};
end

mean_PLI1_AUOLD=sum/14;

sum=zeros(62,62);

for i=1:14
    sum=sum+mean_PLI_OC{i,1};
end

mean_PLI1_OC=sum/14;