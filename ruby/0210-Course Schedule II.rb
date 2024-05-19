# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Integer[]}
#
# Algorithm: Topological Sort using DFS and a stack
# Return [] if there is a cycle in the graph
# 
# Now, to find cycle we can use visited array and DFS with some modification
# We'll mark each node as WHITE first, when we visit a white node we mark it GREY
# if we revisit a grey node that means there's a cycle in the graph
# at the end of dfs of a node, we mark it black
#
# So essentially:
# WHITE - Initial State
# GREY - Intermediate State
# BLACK - Final State
#
STATES = {
  white: 0,
  grey: 1,
  black: 2
}

def find_order(num_courses, prerequisites)
  @graph = make_graph(num_courses, prerequisites)
  @ans = []
  @visited = [STATES[:white]] * num_courses
  @cycle_found = false

  @graph.each do |vertex, edges|
    dfs(vertex) if @visited[vertex] != STATES[:black]
  end
  @cycle_found ? [] : @ans
end

def dfs(u)
  return if @cycle_found

  # if current node is already grey, that means there is a cycle
  if @visited[u] == STATES[:grey]
    @cycle_found = true
    return
  end

  # mark u (a white node) as grey
  @visited[u] = STATES[:grey]

  # recursively call dfs on adjacent non black nodes
  @graph[u].each do |v|
    dfs(v) if @visited[v] != STATES[:black]
  end

  # all adjacent nodes are visited, this is the last node of recursion
  # mark the last node of recursion as black
  @ans << u
  @visited[u] = STATES[:black]
end

def make_graph(num_vertices, edges)
  graph = {}
  0.upto(num_vertices - 1).each do |vertex|
    graph[vertex] = []
  end
  edges.each do |u, v|
    graph[u] << v
  end
  graph
end

puts find_order(4, [[1,0],[2,0],[3,1],[3,2]]).join(', ')