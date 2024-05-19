# @param {Integer[][]} graph
# @return {Integer[][]}
def all_paths_source_target(graph)
  @graph = make_graph(graph)
  @ans = []
  dfs(0, [0])
  @ans
end

def dfs(u, path)
  if u == @graph.size - 1
    @ans << path
    return
  end

  @graph[u].each do |v|
    dfs(v, path + [v])
  end
end

def make_graph(graph)
  graph.each_with_index.each_with_object({}) do |(nodes, i), g|
    g[i] = nodes
  end
end