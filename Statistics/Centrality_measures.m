
%Needs avg_AU, avg_OC in worspace

%Change centrality measure  in line 29 and 33.

overall_average_centrality_AU = zeros(62, 16, 3);
intra_average_centrality_AU = zeros(62, 16, 3);
inter_average_centrality_AU = zeros(62, 16, 3);

overall_average_centrality_OC = zeros(62, 16, 3);
intra_average_centrality_OC = zeros(62, 16, 3);
inter_average_centrality_OC = zeros(62, 16, 3);

centrality_AU = zeros(62, 16, 3);
centrality_OC = zeros(62, 16, 3);

for band1 = 1:5
    for band2 = 1:5
        disp(strcat('Now evaluating',32,num2str(band1),32,'and',32,num2str(band2)))
        
        for k=1:3
            for i=1:16
                supra_mat_AU = squeeze(avg_AU(:, :, i, k));
                supra_mat_OC = squeeze(avg_OC(:, :, i, k));
                
                mat = supra_mat_AU(62*(band1 - 1) + 1: 62*band1, 62*(band2 - 1) + 1:62*band2);
%                 G = digraph(mat);
%                 tt = betweenness_wei(mat, 0.85);
                centrality_AU(:, i, k) = betweenness_wei(mat);
                
                mat = supra_mat_OC(62*(band1 - 1) + 1: 62*band1, 62*(band2 - 1) + 1:62*band2);
                G = digraph(mat);
                centrality_OC(:, i, k) = betweenness_wei(mat);
            end
        end
        
        if band1 ~= band2
            inter_average_centrality_AU = inter_average_centrality_AU + centrality_AU;
            inter_average_centrality_OC = inter_average_centrality_OC + centrality_OC;
        else
            intra_average_centrality_AU = intra_average_centrality_AU + centrality_AU;
            intra_average_centrality_OC = intra_average_centrality_OC + centrality_OC;
        end
        
        overall_average_centrality_AU = overall_average_centrality_AU + centrality_AU;
        overall_average_centrality_OC = overall_average_centrality_OC + centrality_OC;
        
        %Analysis on this centrality that we got for a particular frequnecy
        %and for all trials of all segments.
        
        p_values_t = zeros(62, 3);
        p_values_ranksum = zeros(62, 3);
        whos_bigger = zeros(62, 3);
        
        for i=1:62
            for k=1:3
                a = centrality_AU(i, :, k);
                b = centrality_OC(i, :, k);
                [~, p_values_t(i, k)] = ttest(a, b);
                p_values_ranksum(i, k) = ranksum(a, b);
                whos_bigger(i, k) = mean(a(:)) > mean(b(:));
            end
        end
        
        t_test_result = p_values_t < 0.05;
        wilcox_result = p_values_ranksum < 0.05;
        [x1, y1] = find(t_test_result);
        [x2, y2] = find(wilcox_result);
        
        z1 = zeros(length(x1), 1);
        for iter=1:length(x1)
            z1(iter, 1) = whos_bigger(x1(iter, 1), y1(iter, 1));
        end
        
        z2 = zeros(length(x2), 1);
        for iter=1:length(x2)
            z2(iter, 1) = whos_bigger(x2(iter, 1), y2(iter, 1));
        end
        
        %FDR
        fdr_t = zeros(62, 3);
        for nn=1:3
            fdr_t(:, nn) = fdr_bh(p_values_t(:, nn));
        end
        
        fdr_ranksum = zeros(62, 3);
        for nn=1:3
            fdr_ranksum(:, nn) = fdr_bh(p_values_ranksum(:, nn));
        end
        disp(strcat('Significant node difference in Degree Sum between layer',32',num2str(band1),32,'and',32,num2str(band2),32,'are'))
        disp('T-test')
        disp([x1, y1, z1, p_values_t(t_test_result), p_values_t(t_test_result) < 0.01 , fdr_t(t_test_result)])
        disp('Wilcoxon')
        disp([x2, y2, z2, p_values_ranksum(wilcox_result), p_values_ranksum(wilcox_result) < 0.01, fdr_ranksum(wilcox_result)])
    end
end

%Average them

inter_average_centrality_AU = inter_average_centrality_AU./20;
inter_average_centrality_OC = inter_average_centrality_OC./20;

intra_average_centrality_AU = intra_average_centrality_AU./5;
intra_average_centrality_OC = intra_average_centrality_OC./5;


overall_average_centrality_AU = overall_average_centrality_AU./25;
overall_average_centrality_OC = overall_average_centrality_OC./25;


%Significance for INTER

p_values_t = zeros(62, 3);
p_values_ranksum = zeros(62, 3);
whos_bigger = zeros(62, 3);
for i=1:62
    for k=1:3
        a = inter_average_centrality_AU(i, :, k);
        b = inter_average_centrality_OC(i, :, k);
        [~, p_values_t(i, k)] = ttest(a, b);
        p_values_ranksum(i, k) = ranksum(a, b);
        whos_bigger(i, k) = mean(a(:)) > mean(b(:));
    end
end
assignin('base','p_value_t_inter', p_values_t);
assignin('base','p_value_ranksum_inter', p_values_ranksum);
t_test_result = p_values_t < 0.05;
wilcox_result = p_values_ranksum < 0.05;

[x1, y1] = find(t_test_result);
[x2, y2] = find(wilcox_result);

z1 = zeros(length(x1), 1);
for iter=1:length(x1)
    z1(iter, 1) = whos_bigger(x1(iter, 1), y1(iter, 1));
end

z2 = zeros(length(x2), 1);
for iter=1:length(x2)
    z2(iter, 1) = whos_bigger(x2(iter, 1), y2(iter, 1));
end

%FDR
fdr_t = zeros(62, 3);
for nn=1:3
    fdr_t(:, nn) = fdr_bh(p_values_t(:, nn));
end

fdr_ranksum = zeros(62, 3);
for nn=1:3
    fdr_ranksum(:, nn) = fdr_bh(p_values_ranksum(:, nn));
end
disp(strcat('Significant node difference in INTER average'))
disp('T-test')
disp([x1, y1, z1, p_values_t(t_test_result), p_values_t(t_test_result) < 0.01 , fdr_t(t_test_result)])
disp('Wilcoxon')
disp([x2, y2, z2, p_values_ranksum(wilcox_result), p_values_ranksum(wilcox_result) < 0.01, fdr_ranksum(wilcox_result)])



%Significance for INTRA

p_values_t = zeros(62, 3);
p_values_ranksum = zeros(62, 3);
whos_bigger = zeros(62, 3);
for i=1:62
    for k=1:3
        a = intra_average_centrality_AU(i, :, k);
        b = intra_average_centrality_OC(i, :, k);
        [~, p_values_t(i, k)] = ttest(a, b);
        p_values_ranksum(i, k) = ranksum(a, b);
        whos_bigger(i, k) = mean(a(:)) > mean(b(:));
    end
end
assignin('base','p_value_t_intra', p_values_t);
assignin('base','p_value_ranksum_intra', p_values_ranksum);
t_test_result = p_values_t < 0.05;
wilcox_result = p_values_ranksum < 0.05;

[x1, y1] = find(t_test_result);
[x2, y2] = find(wilcox_result);

z1 = zeros(length(x1), 1);
for iter=1:length(x1)
    z1(iter, 1) = whos_bigger(x1(iter, 1), y1(iter, 1));
end

z2 = zeros(length(x2), 1);
for iter=1:length(x2)
    z2(iter, 1) = whos_bigger(x2(iter, 1), y2(iter, 1));
end

%FDR
fdr_t = zeros(62, 3);
for nn=1:3
    fdr_t(:, nn) = fdr_bh(p_values_t(:, nn));
end

fdr_ranksum = zeros(62, 3);
for nn=1:3
    fdr_ranksum(:, nn) = fdr_bh(p_values_ranksum(:, nn));
end
disp(strcat('Significant node difference in INTRA average'))
disp('T-test')
disp([x1, y1, z1, p_values_t(t_test_result), p_values_t(t_test_result) < 0.01 , fdr_t(t_test_result)])
disp('Wilcoxon')
disp([x2, y2, z2, p_values_ranksum(wilcox_result), p_values_ranksum(wilcox_result) < 0.01, fdr_ranksum(wilcox_result)])


%Significance for OVERALL average

p_values_t = zeros(62, 3);
p_values_ranksum = zeros(62, 3);
whos_bigger = zeros(62, 3);
for i=1:62
    for k=1:3
        a = overall_average_centrality_AU(i, :, k);
        b = overall_average_centrality_OC(i, :, k);
        [~, p_values_t(i, k)] = ttest(a, b);
        p_values_ranksum(i, k) = ranksum(a, b);
        whos_bigger(i, k) = mean(a(:)) > mean(b(:));
    end
end

t_test_result = p_values_t < 0.05;
wilcox_result = p_values_ranksum < 0.05;

[x1, y1] = find(t_test_result);
[x2, y2] = find(wilcox_result);

z1 = zeros(length(x1), 1);
for iter=1:length(x1)
    z1(iter, 1) = whos_bigger(x1(iter, 1), y1(iter, 1));
end

z2 = zeros(length(x2), 1);
for iter=1:length(x2)
    z2(iter, 1) = whos_bigger(x2(iter, 1), y2(iter, 1));
end

%FDR
fdr_t = zeros(62, 3);
for nn=1:3
    fdr_t(:, nn) = fdr_bh(p_values_t(:, nn));
end

fdr_ranksum = zeros(62, 3);
for nn=1:3
    fdr_ranksum(:, nn) = fdr_bh(p_values_ranksum(:, nn));
end
disp(strcat('Significant node difference in OVERALL average'))
disp('T-test')
disp([x1, y1, z1, p_values_t(t_test_result), p_values_t(t_test_result) < 0.01 , fdr_t(t_test_result)])
disp('Wilcoxon')
disp([x2, y2, z2, p_values_ranksum(wilcox_result), p_values_ranksum(wilcox_result) < 0.01, fdr_ranksum(wilcox_result)])





inter_degree_sum_AU = squeeze(mean(inter_average_centrality_AU, 1));
inter_degree_sum_OC = squeeze(mean(inter_average_centrality_OC, 1));

intra_degree_sum_AU = squeeze(mean(intra_average_centrality_AU, 1));
intra_degree_sum_OC = squeeze(mean(intra_average_centrality_OC, 1));

p_val_inter_t = zeros(3, 1);
p_val_inter_ranksum = zeros(3, 1);
for xx=1:3
    a = inter_degree_sum_AU(:, xx);
    b = inter_degree_sum_OC(:, xx);
    [~, p_val_inter_t(xx)] = ttest(a, b);
    p_val_inter_ranksum(xx) = ranksum(a, b);
end
mean(inter_degree_sum_AU, 1)
mean(inter_degree_sum_OC, 1)
p_val_inter_t
p_val_inter_ranksum


p_val_intra_t = zeros(3, 1);
p_val_intra_ranksum = zeros(3, 1);
for xx=1:3
    a = intra_degree_sum_AU(:, xx);
    b = intra_degree_sum_OC(:, xx);
    [~, p_val_intra_t(xx)] = ttest(a, b);
    p_val_intra_ranksum(xx) = ranksum(a, b);
end

p_val_intra_t
p_val_intra_ranksum