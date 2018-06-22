function PLI = PLI_Cal1(data)

%chan*points*trials
[cn,pn,tn]=size(data);
PLI=zeros(cn,cn,tn);

for j=1:tn
    
    signal=data(:,:,j)';
    for chh=1:cn
    phaseSignal(chh,:) = angle(hilbert(signal(chh,:)));
    end
    pli=zeros(cn);
    
    for i = 1:(cn-1)
        for m = (i+1):cn
            xx = abs(mean(sign(phaseSignal(:,i)-phaseSignal(:,m))));
%             if xx>=0.15
                pli(i,m)=xx;
%             else
%                 pli(i,m)=0;
%             end
        end
    end
    
    pli = triu(pli);
    pli = pli+pli';
    PLI(:,:,j)=pli;
    
end

end