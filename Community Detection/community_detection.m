
function community_detection(Super_PLI1,Super_PLI2,subject_name)
% subject_name='13';
% load(strcat('D:\Rohit\Creativity Data\Creativity Experiment EEG recording\Subject_0',subject_name,'_EEG\Results\Super_PLI1.mat'));
% load(strcat('D:\Rohit\Creativity Data\Creativity Experiment EEG recording\Subject_0',subject_name,'_EEG\Results\Super_PLI2.mat'));

% load('D:\Rohit\Creativity Data\Creativity Experiment EEG recording\Subject_013_EEG\chanlocs.mat');


for i=1:length(Super_PLI1)
    
    gamma=0.8;
    for ii=1:6
    for j=1:8
        
        for k=1:100            
            [M{i,ii}(:,k),Q(k,ii)]=community_louvain(Super_PLI1{i,1}{ii,1},gamma);
        end        
        count=1;
        for l=1:99
            for m=l+1:100
                nmi_val(count,1)=nmi(M{i,ii}(:,l),M{i,ii}(:,m));               
                count=count+1;
            end
        end
        z1=zscore(nmi_val);
        avg_nmi(j,1)=mean(nmi_val);
        gamma=gamma+0.1;
    end
    [~,pos]=max(avg_nmi);
    sel_gamma1(i,ii)=(pos*0.1)+0.7;
    end
end
    

for i=1:length(Super_PLI2)
    
    gamma=0.8;
    for ii=1:6
    for j=1:8
        
        for k=1:100
            
            [M1{i,ii}(:,k),Q1(k,ii)]=community_louvain(Super_PLI2{i,1}{ii,1},gamma);
        end        
        count=1;
        for l=1:99
            
            for m=l+1:100
                nmi_val1(count,1)=nmi(M1{i,ii}(:,l),M1{i,ii}(:,m));
                count=count+1;
            end
        end
        avg_nmi1(j,1)=mean(nmi_val1);
        gamma=gamma+0.1;
    end
    [~,pos]=max(avg_nmi1);
    sel_gamma2(i,ii)=(pos*0.1)+0.7;
    end
end  

for i=1:length(Super_PLI1)

    for ii=1:6
        optimized_clusterAU{ii,1}(:,i)=community_louvain(Super_PLI1{i,1}{ii,1},sel_gamma1(i,ii));        
    end
end
for i=1:length(Super_PLI2)

    for ii=1:6
        optimized_clusterOC{ii,1}(:,i)=community_louvain(Super_PLI2{i,1}{ii,1},sel_gamma2(i,ii));        
    end
end

    for j=1:6
        D1{j,1}=agreement(optimized_clusterAU{j,1});
        CIU_AU(:,j)=consensus_und(D1{j,1},1,50);
    end


    for j=1:6
        D2{j,1}=agreement(optimized_clusterOC{j,1});
        CIU_OC(:,j)=consensus_und(D2{j,1},1,50);
    end
    
%     BandName={'Delta','Theta','Alpha','Beta','Gamma'};
%     count=1;
%     for b=[1,3,5,7,9]        
%         subplot(5,2,b)
%         topoplot(CIU_AU(:,count), chanlocs,'maplimits','maxmin');
%         count=count+1;
% %         title([BandName(b)]);
% %     saveas(h1,['s1_d_t4_' BandName{b} '.fig'],'fig')
%     end
count=1;
%     for b=[2,4,6,8,10]        
%         subplot(5,2,b)
%         topoplot(CIU_OC(:,count), chanlocs,'maplimits','maxmin');
%         count=count+1;
% %         title([BandName(b)]);
% %     saveas(h1,['s1_d_t4_' BandName{b} '.fig'],'fig')
%     end
% CIU_AU_27=CIU_AU;
% CIU_OC_27=CIU_OC;
save(strcat('D:\Rohit\Creativity Data\Creativity Experiment EEG recording\Subject_0',num2str(subject_name),'_EEG\Results\community.mat'));
save(strcat('D:\Rohit\Creativity Data\Community Detection\Results\CIU_AU_',num2str(subject_name),'.mat'),strcat('CIU_AU'));
save(strcat('D:\Rohit\Creativity Data\Community Detection\Results\CIU_OC_',num2str(subject_name),'.mat'),strcat('CIU_OC'));
end