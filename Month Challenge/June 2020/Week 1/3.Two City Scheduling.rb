# @param {Integer[][]} costs
# @return {Integer}
# Nice Explanation: https://www.youtube.com/watch?v=cevaICIEyjs
#
def two_city_sched_cost(costs)
  costs.sort_by! { |a, b| a - b }
  mid = costs.size / 2

  ans = 0
  costs.each_with_index do |cost, i|
    ans += i < mid ? cost.first : cost.last
  end
  ans
end