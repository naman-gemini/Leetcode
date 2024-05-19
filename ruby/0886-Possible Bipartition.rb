# @param {Integer} n
# @param {Integer[][]} dislikes
# @return {Boolean}
def possible_bipartition(n, dislikes)
  @graph = create_graph(n, dislikes)
  color_graph
end

def create_graph(n, edges)
  graph = {}
  (1..n).each { |v| graph[v] = [] }

  edges.each do |a, b|
    graph[a] << b
    graph[b] << a
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