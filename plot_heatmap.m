function [] = plot_heatmap(array)

figure
colormap('jet')
imagesc(abs(array))
caxis([0 0.35])
colorbar
end
