function output = find_degree_intralayer(input)
%input is supra_adjacency matrix

nnodes = 62;
nlayers = 5;

degree_sum = zeros(nnodes, nlayers);
for j = 1:nlayers
  adj_matrix = input((62*(j-1) + 1):62*j, (62*(j-1) + 1):62*j);
  degree_sum(:, j) = sum(adj_matrix, 2);
end
output = sum(degree_sum, 2);
end