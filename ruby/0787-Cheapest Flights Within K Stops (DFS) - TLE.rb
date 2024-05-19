# @param {Integer} n
# @param {Integer[][]} flights
# @param {Integer} src
# @param {Integer} dst
# @param {Integer} k
# @return {Integer}
# This is the DFS solution which times out
INF = 1.0/0

def find_cheapest_price(n, flights, src, dst, k)
  @graph = build_graph(n, flights)
  @prices = build_prices(flights)
  @min_price = INF
  @dst = dst
  @k = k

  solve(n, src)
  @min_price == INF ? -1 : @min_price
end

def solve(n, src)
  @graph[src].each do |v|
    dfs(src, v, 0, 0)
  end
end

def dfs(u, v, stops, cumulative_cost)
  stops += 1 if v != @dst
  return if stops > @k

  cumulative_cost += @prices[[u, v]]

  if v == @dst
    @min_price = cumulative_cost if cumulative_cost < @min_price
    return
  end

  @graph[v].each do |adjacent_v|
    next if cumulative_cost + @prices[[v, adjacent_v]] > @min_price
    dfs(v, adjacent_v, stops, cumulative_cost)
  end
end

# We'll store graph like a hash of arrays.
# Key would be a vertice, value would be an array of vertices denoting an edge between key vertice and this vertice. 
def build_graph(n, edges)
  graph = {}
  0.upto(n - 1).each do |i|
    graph[i] = []
  end

  edges.each do |edge|
    graph[edge[0]] << edge[1]
  end

  graph
end

# Prices will be stored as a hash keyed on an array [vertice1, vertice2], value being the price
def build_prices(edges)
  prices = {}
  edges.each do |edge|
    prices[[edge[0], edge[1]]] = edge[2]
  end
  prices
end