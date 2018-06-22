%metric calculator


function significant = find_significance(avg_AUNEW, avg_AUOLD, avg_OC, metric)

%Metrics which returns 62 values for each supra adjacency matrix

[s, ~, ~, ~, ~] = size(avg_AUNEW);

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
        metric_AUNEW(:, i, j) = metric(avg_AUNEW(:, :, i, j));
    end
end

for i=1:16
    for j = 1:3
        metric_AUOLD(:, i, j) = metric(avg_AUOLD(:, :, i, j));
    end
end

for i=1:16
    for j = 1:3
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
        [p, ~, st] = friedman([a' b' c'], 1, 'off');
        if p<=0.05
            significant(i, j) = 1;
            disp(strcat('For Electrode',32,num2str(i),32,'and Segment',32,num2str(j)))
            multcompare(st)
        end
    end
end
end