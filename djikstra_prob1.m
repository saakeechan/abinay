clear
clc

graph = [
    0, 3, Inf, Inf, Inf, 2, Inf;
    3, 0, 1, Inf, Inf, 4, 5;
    Inf, 1, 0, 2, Inf, Inf, Inf;
    Inf, Inf, 2, 0, 6, Inf, Inf;
    Inf, Inf, Inf, 6, 0, 7, Inf;
    2, 4, Inf, Inf, 7, 0, 8;
    Inf, 5, Inf, Inf, Inf, 8, 0;]
starting_node = 3;

n = length(graph);
visited=[];
prev_node = [];
unvisited=[1:n];

distance = inf*(ones(1,n));
distance(starting_node) = 0;


while length(unvisited)~=0

    [~,visiting_node] = min(distance(unvisited))
visiting_node = unvisited(visiting_node)


nbr_nodes = graph(visiting_node,unvisited)<Inf
index = unvisited==visiting_node
nbr_nodes(index)=0
nbr_nodes = unvisited(nbr_nodes)

for i = 1:length(nbr_nodes)

    if distance(nbr_nodes(i)) > (graph(visiting_node,nbr_nodes(i)) + distance(visiting_node))
        distance(nbr_nodes(i)) = (graph(visiting_node,nbr_nodes(i)) + distance(visiting_node))
        prev_node(nbr_nodes(i)) = [visiting_node]

    end
end

visited = [visited visiting_node];
unvisited(index)=[]
end