function output = find_betweenness_centrality(input)

output = zeros(62, 1);

for i=1:5
    for j=1:5
        temp = input(62*(i-1)+1:62*i, 62*(j-1)+1:62*j);
        G = digraph(temp);
        output = output + centrality(G, 'betweenness');
    end
end