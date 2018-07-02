function [op_AUNEW, op_AUOLD, op_OC, p_AUNEW, p_AUOLD, p_OC] = inter_layer_correlation_mean(avg_AUNEW, avg_AUOLD, avg_OC)

avg_mean_AUNEW = zeros(5,5,14,3);
avg_mean_AUOLD = zeros(5,5,16,3);
avg_mean_OC = zeros(5,5,16,3);

for subject=1:14
    for seg=1:3
        supra = squeeze(avg_AUNEW(:, :, subject, seg));
        
        for i=1:5
            for j=1:5
                dummy = supra(62*(i-1)+1:62*i, 62*(j-1)+1:62*j);
                avg_mean_AUNEW(i, j, subject, seg) = mean(dummy(:));
            end
        end
    end
end


for subject=1:16
    for seg=1:3
        supra = squeeze(avg_AUOLD(:, :, subject, seg));
        
        for i=1:5
            for j=1:5
                dummy = supra(62*(i-1)+1:62*i, 62*(j-1)+1:62*j);
                avg_mean_AUOLD(i, j, subject, seg) = mean(dummy(:));
            end
        end
    end
end

for subject=1:16
    for seg=1:3
        supra = squeeze(avg_OC(:, :, subject, seg));
        
        for i=1:5
            for j=1:5
                dummy = supra(62*(i-1)+1:62*i, 62*(j-1)+1:62*j);
                avg_mean_OC(i, j, subject, seg) = mean(dummy(:));
            end
        end
    end
end


op_AUNEW = zeros(5, 5, 3);
op_AUOLD = zeros(5, 5, 3);
op_OC = zeros(5, 5, 3);

p_AUNEW = zeros(5, 5, 3);
p_AUOLD = zeros(5, 5, 3);
p_OC = zeros(5, 5, 3);

for seg=1:3
    for i=1:5
        for j=1:5
            a = squeeze(avg_mean_AUNEW(i, j, :, seg));
            b = squeeze(avg_mean_AUNEW(j, j, :, seg));
%             assignin('base', 'a1', a)
%             assignin('base', 'b1', b)
            [op_AUNEW(i, j, seg), p_AUNEW(i, j, seg)] = corr(a, b);
            
            a = squeeze(avg_mean_AUOLD(i, j, :, seg));
            b = squeeze(avg_mean_AUOLD(j, j, :, seg));
            [op_AUOLD(i, j, seg), p_AUOLD(i, j, seg)] = corr(a, b);
            
            a = squeeze(avg_mean_OC(i, j, :, seg));
            b = squeeze(avg_mean_OC(j, j, :, seg));
            [op_OC(i, j, seg), p_OC(i, j, seg)] = corr(a, b);
        end
    end
end