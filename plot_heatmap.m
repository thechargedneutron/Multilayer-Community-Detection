function [] = plot_heatmap(array)

figure
colormap('jet')
imagesc(abs(array))
caxis([0.0 0.4])
colorbar
end
