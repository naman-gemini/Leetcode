# @param {Integer[][]} graph
# @return {Boolean}
def is_bipartite(graph)
  @graph = create_graph(graph)
  color_graph
end

def create_graph(edges_array)
  graph = {}

  edges_array.each_with_index do |edges, i|
    graph[i] ||= []

    edges.each do |edge|
      graph[i] << edge
    end
  end

  graph
end

def color_graph
  @g1, @g2 = [], [] # groups
  @colors = {}

  @graph.keys.each do |u|
    if @colors[u].nil? # consider this vertex only if it's not already colored
      # put in group 1
      @g1 << u
      # assign color red (0)
      @colors[u] = 0
      # color adjacent vertices as blue (1)
      return false unless dfs(u, 1)
    end
  end
  true
end

def dfs(vertex, color)
  @graph[vertex].each do |v|
    if @colors[v].nil? # only proceed if vertex is not colored
      @g1 << v if color == 0
      @g2 << v if color == 1
      @colors[v] = color
      return false unless dfs(v, 1 - color)
    elsif @colors[v] == (1 - color)
      return false
    end
  end
end

puts is_bipartite([[2,3,5,6,7,8,9],[2,3,4,5,6,7,8,9],[0,1,3,4,5,6,7,8,9],[0,1,2,4,5,6,7,8,9],[1,2,3,6,9],[0,1,2,3,7,8,9],[0,1,2,3,4,7,8,9],[0,1,2,3,5,6,8,9],[0,1,2,3,5,6,7],[0,1,2,3,4,5,6,7]])