function [] = plot_mean_with_std_error(list_of_indices, AUNEW_clustering_coeff, AUOLD_clustering_coeff, OC_clustering_coeff)

for j=1:length(list_of_indices)
a = AUNEW_clustering_coeff(list_of_indices(j, 2), :, list_of_indices(j, 1));
b = AUOLD_clustering_coeff(list_of_indices(j, 2), :, list_of_indices(j, 1));
c = OC_clustering_coeff(list_of_indices(j, 2), :, list_of_indices(j, 1));
mean_velocity = [mean(a) mean(b) mean(c)];
std_velocity = [std(a)/sqrt(length(a)) std(b)/sqrt(length(b)) std(c)/sqrt(length(c))];
figure
bar(mean_velocity)
set(gca, 'xtickLabel', {'AUNEW', 'AUOLD', 'OC'})
hold on
errorbar(1:3, mean_velocity, std_velocity, '.')
lower_bound = [mean(a) - std(a)/sqrt(length(a)), mean(b) - std(b)/sqrt(length(b)) , mean(c)-std(c)/sqrt(length(c))];
upper_bound = [mean(a) + std(a)/sqrt(length(a)), mean(b) + std(b)/sqrt(length(b)) , mean(c)+std(c)/sqrt(length(c))];
ylim([min(lower_bound) - .001, max(upper_bound) + .001]);
saveas(gcf,strcat(num2str(list_of_indices(j, 2)),32,num2str(list_of_indices(j, 1))), 'png')
end