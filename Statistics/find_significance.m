%metric calculator


function significant = find_significance(metric)

%Metrics which returns 62 values for each supra adjacency matrix

load('avg_AUNEW_thres.mat');
load('avg_AUOLD_thres.mat');
load('avg_OC_thres.mat');

avg_AUNEW = avg_AUNEW_thres;
avg_AUOLD = avg_AUOLD_thres;
avg_OC = avg_OC_thres;

[s, ~, ~, ~] = size(avg_AUNEW);

if s==372
    avg_AUNEW = avg_AUNEW(63:end, 63:end, :, :);
    avg_AUOLD = avg_AUOLD(63:end, 63:end, :, :);
    avg_OC = avg_OC(63:end, 63:end, :, :);
end

metric_AUNEW = zeros(62, 14, 3);
metric_AUOLD = zeros(62, 16, 3);
metric_OC = zeros(62, 16, 3);

for i=1:14
    for j = 1:3
%         [~, avg_AUNEW(:, :, i, j), ~, ~, ~, ~] = threshold_omst_gce_wd(avg_AUNEW(:, :, i, j), 0);
        metric_AUNEW(:, i, j) = metric(avg_AUNEW(:, :, i, j));
    end
end

for i=1:16
    for j = 1:3
%         [~, avg_AUOLD(:, :, i, j), ~, ~, ~, ~] = threshold_omst_gce_wd(avg_AUOLD(:, :, i, j), 0);
        metric_AUOLD(:, i, j) = metric(avg_AUOLD(:, :, i, j));
    end
end

for i=1:16
    for j = 1:3
%         [~, avg_OC(:, :, i, j), ~, ~, ~, ~] = threshold_omst_gce_wd(avg_OC(:, :, i, j), 0);
        metric_OC(:, i, j) = metric(avg_OC(:, :, i, j));
    end
end

significant = zeros(62, 3);

for i=1:62
    for j = 1:3
        a = squeeze(metric_AUNEW(i, :, j));
        b = squeeze(metric_AUOLD(i, :, j));
        c = squeeze(metric_OC(i, :, j));
        b(14) = [];
        b(2) = [];
        c(14) = [];
        c(2) = [];
        assignin('base', 'a1', a);
        assignin('base','b1',b);
        assignin('base','c1',c);
        [p, ~, st] = friedman([a' b' c'],1, 'off');
        if p<=0.05
            significant(i, j) = p;
            disp(strcat('For Electrode',32,num2str(i),32,'and Segment',32,num2str(j)))
            multcompare(st)
            
            mean_velocity = [mean(a) mean(b) mean(c)];
            std_velocity = [std(a)/sqrt(length(a)) std(b)/sqrt(length(b)) std(c)/sqrt(length(c))];
            figure('visible', 'off');
            bar(mean_velocity)
            set(gca, 'xtickLabel', {'AUNEW', 'AUOLD', 'OC'})
            hold on
            errorbar(1:3, mean_velocity, std_velocity, '.')
            lower_bound = [mean(a) - std(a)/sqrt(length(a)), mean(b) - std(b)/sqrt(length(b)) , mean(c)-std(c)/sqrt(length(c))];
            upper_bound = [mean(a) + std(a)/sqrt(length(a)), mean(b) + std(b)/sqrt(length(b)) , mean(c)+std(c)/sqrt(length(c))];
            ylim([min(lower_bound(:))-0.01 max(upper_bound(:))+0.01]);
            saveas(gcf, strcat('Node_', num2str(i), 'Segment_', num2str(j)), 'png');

        end
    end
end

ss = fdr_bh(significant);
assignin('base', 'v', ss);
end