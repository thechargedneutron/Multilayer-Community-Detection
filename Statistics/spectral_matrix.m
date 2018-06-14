function output = spectral_matrix(supra_mat)

q1 = zeros(size(supra_mat));
q2 = -supra_mat;

for layer=1:5
    delta = diag(sum(supra_mat(62*(layer-1) + 1:62*layer, 62*(layer-1)+1:62*layer)));
    q1(62*(layer-1) + 1:62*layer, 62*(layer-1) + 1:62*layer) = delta - supra_mat(62*(layer-1) + 1:62*layer, 62*(layer-1) + 1:62*layer);
    
    q2(62*(layer-1) + 1:62*layer, 62*(layer-1)+1:62*layer) = 0;
    answ = zeros(62, 62);
    for j=1:5
        if layer ~= j 
            answ = answ + supra_mat(62*(j-1) + 1:62*j, 62*(layer-1)+1:62*layer);
        end
    end
    q2(62*(layer-1) + 1:62*layer, 62*(layer-1)+1:62*layer) = answ;
end

Q = q1+q2;

R = laplacian(Q);

output = 310 * trace(pinv(R));

end