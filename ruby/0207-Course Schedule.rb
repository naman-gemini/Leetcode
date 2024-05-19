# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
#
# All we need to do is find if the graph has cycle or not
# If it doesn't have a cycle, then it can be topologically sorted
# Note: We don't have to do the sort here
#
# NOTE: Better to use white, grey approach as done in problem 210
#
def can_finish(num_courses, prerequisites)
  @graph = create_graph(prerequisites)
  @graph.keys.each do |node|
    return false if cycle?(node)
  end
  true
end

def create_graph(edges)
  graph = {}
  edges.each do |u, v|
    graph[u] ||= []
    graph[u] << v
  end
  graph
end

def cycle?(node, visited = Set.new, recur = Set.new)
  visited << node # Keep track of nodes visited globally
  recur << node # Keep track of nodes visited as far as a path goes

  (@graph[node] || []).each do |neighbor|
    # Only DFS again if the node hasn't already been visited / searched.
    return true if !visited.include?(neighbor) && cycle?(neighbor, visited, recur)

    # Break condition:
    # There is only a cycle if this node has been encountered on the current recursive path.
    return true if recur.include?(neighbor)
  end

  # Remove the node from the recursive path.
  # At this point, it's been explored to it's end / depth.
  recur.delete(node)

  # If we make it to the end of a path, it doesn't have a cycle.
  # A cycle never ends, and the break point above is what keeps this from going on forever.
  return false
end