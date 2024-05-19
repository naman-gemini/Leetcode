# @param {Integer[]} prices
# @return {Integer}
INF = 1.0 / 0
def max_profit(prices)
  profit_max, min_price = 0, INF
  prices.each do |price|
    min_price = price if price < min_price
    profit_max = [profit_max, price - min_price].max
  end
  profit_max
end