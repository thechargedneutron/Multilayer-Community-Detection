

low = squeeze(avg_AUNEW(:, :, :, 3));
medium = squeeze(avg_AUOLD(:, :, :, 3));
high = squeeze(avg_OC(:, :, :, 3));

p_values = zeros(310, 310);

for i=1:310
    for j=1:310
        a = squeeze(low(i, j, :));
        b = squeeze(medium(i, j, :));
        c = squeeze(high(i, j, :));
        data = [a' b' c'];
        labels = [1*ones(1, 14), 2*ones(1, 16), 3*ones(1, 16)];
        [p_values(i, j), ~, st(i, j)] = anova1(data, labels, 'off');
    end
end

x1 = p_values(triu(true(size(p_values)), 1));
[fdr_sig_temp, x, y] = fdr_bh(x1);
a1 = triu(ones(310)) - eye(310);
a1(a1 > 0) = fdr_sig_temp;
fdr_sig = (a1 + a1')./(eye(310)+1);

fdr_sig = boolean(fdr_sig);

temp_f = (squeeze(mean(low, 3)) > squeeze(mean(medium, 3))) + 1;
fin = zeros(310, 310);

for xx=1:310
    for yy=1:310
        if fdr_sig(xx, yy) == 1
            fin(xx, yy) = temp_f(xx, yy);
        end
    end
end

count = sum(fdr_sig(:));
disp(strcat('Numer of significant is ',num2str(count/2)));

for i=1:310
    for j=i+1:310
        if fdr_sig(i, j) == 1
            disp(strcat('Layer ', num2str(ceil(i/62)), 'Node ', num2str(rem(i-1, 62) + 1), 'Layer ', num2str(ceil(j/62)), 'Node ', num2str(rem(j-1, 62) + 1)))
            multcompare(st(i, j), 'Display','off')
            a = squeeze(low(i, j, :));
            b = squeeze(medium(i, j, :));
            c = squeeze(high(i, j, :));
            
            mean_velocity = [mean(a) mean(b) mean(c)];
            std_velocity = [std(a)/sqrt(length(a)) std(b)/sqrt(length(b)) std(c)/sqrt(length(c))];
            figure('visible', 'off');
            bar(mean_velocity)
            set(gca, 'xtickLabel', {'AUNEW', 'AUOLD', 'OC'})
            hold on
            errorbar(1:3, mean_velocity, std_velocity, '.')
            lower_bound = [mean(a) - std(a)/sqrt(length(a)), mean(b) - std(b)/sqrt(length(b)) , mean(c)-std(c)/sqrt(length(c))];
            upper_bound = [mean(a) + std(a)/sqrt(length(a)), mean(b) + std(b)/sqrt(length(b)) , mean(c)+std(c)/sqrt(length(c))];
            ylim([min(lower_bound) - .001, max(upper_bound) + .001]);
            saveas(gcf, strcat('Layer_', num2str(ceil(i/62)), 'Node_', num2str(rem(i-1, 62) + 1), 'Layer_', num2str(ceil(j/62)), 'Node_', num2str(rem(j-1, 62) + 1)), 'png');
        end
    end
end