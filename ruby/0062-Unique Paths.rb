# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  dp = Array.new(m + 1) { Array.new(n + 1) }
  0.upto(m-1).each { |i| dp[i][0] = 1 }
  0.upto(n-1).each { |j| dp[0][j] = 1 }
  
  1.upto(m-1).each do |i|
    1.upto(n-1).each do |j|
      dp[i][j] = dp[i-1][j] + dp[i][j-1]
    end
  end
  dp[m-1][n-1]
end

puts unique_paths(7,3)