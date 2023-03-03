#Q1

library(igraph)

#links in data
edges <-rbind(
  c("A", "B"), c("A", "C"), 
  c("B", "A"), c("B", "C"), 
  c("C", "A"), c("C", "B"), c("C", "D"),
  c("D", "C"), c("D", "E"), 
  c("E", "D")
)

#generate and plot graph
g <- graph.edgelist(edges, directed = TRUE)
plot(g, vertex.size = 1, vertex.label.dist = 0.5)

plot(g, layout = layout_in_circle, vertex.size = 1, vertex.label.dist = 0.5)
plot(g, layout = layout_on_grid, vertex.size = 1, vertex.label.dist = 0.5)

degree(g)
betweenness(g)
closeness(g)
eigen_centrality(g)

#calculate density
degree.distribution(g) #normalized distributions
edge_density(g)

#tabulate?
plot(g, vertex.label = NA, vertex.size = eigen_centrality(g)$vector * 20)

#adjacency entries
get.adjacency(g) 

#Q2

library(igraph)

#links in data
edges <-rbind(
  c("A", "D"), c("A", "C"), #2 neighbors
  c("B", "A"), c("B", "F"), #2 neighbors
  c("C", "A"), c("C", "E"), #2 neighbors
  c("D", "A"), c("D", "E"), #2 neighbors
  c("E", "D"), c("E", "G"), c("E", "C") #3 neighbors
)

#generate and plot graph
g <- graph.edgelist(edges, directed = TRUE)
plot(g, vertex.size = 1, vertex.label.dist = 0.5)

plot(g, layout = layout_in_circle, vertex.size = 1, vertex.label.dist = 0.5)
plot(g, layout = layout_on_grid, vertex.size = 1, vertex.label.dist = 0.5)

degree(g)
betweenness(g)
closeness(g)
eigen_centrality(g)

#calculate density
degree.distribution(g) #normalised distributions
edge_density(g)

#adjacency entries
get.adjacency(g)

#compute shortest paths
shortest.paths(g)
get.shortest.paths(g,4)


