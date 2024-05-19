# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  profit, i = 0, 0
  while i < prices.size
    buy = i
    i += 1 while i < prices.size - 1 && prices[i + 1] > prices[i]
    sell = i
    profit += prices[sell] - prices[buy]
    i += 1
  end
  profit
end

puts max_profit([7,6,4,3,1])