%metric calculator


function [significant, metric_value] = find_significance(avg_AUNEW, avg_AUOLD, avg_OC, metric)

% name = ['Intra_', 'Inter_', 'Clustering_'];

%Metrics which returns 62 values for each supra adjacency matrix

[~, ~, num_AUNEW, ~] = size(avg_AUNEW);
[~, ~, num_AUOLD, ~] = size(avg_AUOLD);
[~, ~, num_OC, ~] = size(avg_OC);

metric_value = {};

metric_AUNEW = zeros(62, num_AUNEW, 3);
metric_AUOLD = zeros(62, num_AUOLD, 3);
metric_OC = zeros(62, num_OC, 3);

for i=1:num_AUNEW
    for j = 1:3
%         [~, avg_AUNEW(:, :, i, j), ~, ~, ~, ~] = threshold_omst_gce_wd(avg_AUNEW(:, :, i, j), 0);
        metric_AUNEW(:, i, j) = metric(avg_AUNEW(:, :, i, j));
    end
end

for i=1:num_AUOLD
    for j = 1:3
%         [~, avg_AUOLD(:, :, i, j), ~, ~, ~, ~] = threshold_omst_gce_wd(avg_AUOLD(:, :, i, j), 0);
        metric_AUOLD(:, i, j) = metric(avg_AUOLD(:, :, i, j));
    end
end

for i=1:num_OC
    for j = 1:3
%         [~, avg_OC(:, :, i, j), ~, ~, ~, ~] = threshold_omst_gce_wd(avg_OC(:, :, i, j), 0);
        metric_OC(:, i, j) = metric(avg_OC(:, :, i, j));
    end
end


metric_value{1} = metric_AUNEW;
metric_value{2} = metric_AUOLD;
metric_value{3} = metric_OC;

significant = zeros(62, 3);

for i=1:62
    for j = 1:3
        a = squeeze(metric_AUNEW(i, :, j));
        b = squeeze(metric_AUOLD(i, :, j));
        c = squeeze(metric_OC(i, :, j));
        assignin('base', 'a1', a);
        assignin('base','b1',b);
        assignin('base','c1',c);
        [p, ~, st] = anova1([a b c],[1*ones(1, num_AUNEW) 2*ones(1, num_AUOLD) 3*ones(1, num_OC)], 'off');
        if p<=0.05
            disp(strcat('Node',32,num2str(i),32,'Segment',32,'value',num2str(p)))
            significant(i, j) = p;
            disp(strcat('For Electrode',32,num2str(i),32,'and Segment',32,num2str(j)))
%             multcompare(st)
%             
%             mean_velocity = [mean(a) mean(b) mean(c)];
%             std_velocity = [std(a)/sqrt(length(a)) std(b)/sqrt(length(b)) std(c)/sqrt(length(c))];
%             figure('visible', 'off');
%             bar(mean_velocity)
%             set(gca, 'xtickLabel', {'AUNEW', 'AUOLD', 'OC'})
%             hold on
%             errorbar(1:3, mean_velocity, std_velocity, '.')
%             lower_bound = [mean(a) - std(a)/sqrt(length(a)), mean(b) - std(b)/sqrt(length(b)) , mean(c)-std(c)/sqrt(length(c))];
%             upper_bound = [mean(a) + std(a)/sqrt(length(a)), mean(b) + std(b)/sqrt(length(b)) , mean(c)+std(c)/sqrt(length(c))];
%             ylim([min(lower_bound(:))-0.01 max(upper_bound(:))+0.01]);
%             saveas(gcf, strcat(name(num),'Node_', num2str(i), '_Segment_', num2str(j)), 'png');

        end
    end
end

ss = fdr_bh(significant);
assignin('base', 'v', ss);
end