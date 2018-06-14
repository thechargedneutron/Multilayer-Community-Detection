function output = clustering_coefficient(supra_mat)
output = zeros(62, 1);
for node = 1:62
    sumx = 0;
    for layer=1:5
        for layer2 = 1:5
            if layer ~= layer2
                for nodex = 1:62
                    for nodey = 1:62
                        if nodex ~= node && nodey ~= node
                            sumx = sumx + supra_mat(62*(layer-1) + node, 62*(layer-1) + nodex) * supra_mat(62*(layer2-1) + nodey, 62*(layer2-1) + nodex) * supra_mat(62*(layer-1) + node, 62*(layer-1) + nodey);
                        end
                    end
                end
            end
        end
    end
    output(node) = sumx;
end

sum2 = 0;
for layer = 1:5
    t = supra_mat(62*(layer-1) + 1:62*layer, 62*(layer-1)+1:62*layer);
    di = sum(t, 2);
    sum2 = sum2 + di .*(di - 1);
end

output = output./sum2;
output = output/4;