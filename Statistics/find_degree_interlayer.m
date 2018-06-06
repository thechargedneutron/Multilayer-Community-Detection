function output = find_degree_interlayer(input)
%Input is supra-adjacency matrix

nnodes = 62;
nlayers = 5;

%Remove delta
[x, ~] = size(input);
if x == 372
input = input(63:end, 63:end);
end

degree_sum = zeros(nnodes, nlayers);
for j = 1:nlayers
  dummy_input = input((62*(j-1) + 1):62*j, :);
  dummy_input(:, (62*(j-1) + 1):62*j) = 0;
  degree_sum(:, j) = sum(dummy_input, 2);
end
output = sum(degree_sum, 2);
end