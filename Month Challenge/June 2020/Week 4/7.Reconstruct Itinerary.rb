# @param {String[][]} tickets
# @return {String[]}
#
# Algorithm: Topological Sort
#
def find_itinerary(tickets)
  graph = make_graph(tickets)
  stack = []

  graph['JFK'].each do |v|
    
  end
end

def make_graph(edges)
  graph = {}
  edges.each do |edge|
    graph[edge[0]] ||= []
    graph[edge[0]] << edge[1]
  end
  graph
end