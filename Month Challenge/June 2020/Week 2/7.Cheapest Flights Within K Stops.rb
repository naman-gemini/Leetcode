# @param {Integer} n
# @param {Integer[][]} flights
# @param {Integer} src
# @param {Integer} dst
# @param {Integer} k
# @return {Integer}
# Algorithm: Bellman Ford (run it k + 1 times instead of V - 1 times)
INF = 1.0/0

def find_cheapest_price(n, flights, src, dst, k)
  # Step 1: Initialize distances from src to all other vertices as INFINITE  
  dist = [INF] * n
  dist[src] = 0

  # Step 2: Relax all edges |V| - 1 times. A simple shortest  
  # path from src to any other vertex can have at-most |V| - 1  edges
  # Constraint: We can have at max k jumps.
  (k + 1).times do
    temp = dist.dup
    flights.each do |u, v, weight|
      temp[v] = dist[u] + weight if dist[u] != INF && temp[v] > dist[u] + weight
    end
    dist = temp
  end

  dist[dst] == INF ? -1 : dist[dst]
end