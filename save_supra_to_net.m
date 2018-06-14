function [] = save_supra_to_net(mat)

fid = fopen('tempxx.net', 'wt');
fprintf(fid, '# A network in a general multiplex format\n');
fprintf(fid, '*Vertices 62\n');
for iii=1:62
    fprintf(fid, strcat(num2str(iii), ' "Node',32,num2str(iii),'"\n'));
end
fprintf(fid, '*Multilayer\n');
fprintf(fid, '# layer node layer node [weight]\n');
[row, col] = size(mat);
for r=1:row
    for c=1:col
        layer_row = ceil(r/62);
        node_row = mod(r-1, 62) + 1;
        
        layer_col = ceil(c/62);
        node_col = mod(c-1, 62) + 1;
        fprintf(fid, strcat(num2str(layer_row), 32, num2str(node_row), 32, num2str(layer_col),32,num2str(node_col),32,num2str(mat(r, c)),'\n'));
    end
end