# @param {Integer} n
# @param {Integer[][]} trust
# @return {Integer}
# Algo: Calculate indegree outdegree
#
def find_judge(n, trust)
degrees = Array.new(n+1, 0) # In degree - Out degree
  trust.each { |a,b|
    degrees[a] -= 1
    degrees[b] += 1
  }
  (1..n).each { |i| return i if degrees[i] == n-1 } # n-1 people should trust town judge
  -1
end