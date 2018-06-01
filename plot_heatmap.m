function [] = plot_heatmap(array)

figure
colormap('jet')
imagesc(abs(array))
colorbar
end
