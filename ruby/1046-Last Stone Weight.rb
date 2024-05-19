# @param {Integer[]} stones
# @return {Integer}
def last_stone_weight(stones)
  while stones.size > 1
    stones.sort!
    second_last, last = stones[-2], stones[-1]
    stones.pop # remove last element
    stones.pop # remove second last element
    stones << last - second_last if second_last < last
  end
  stones.empty? ? 0 : stones.first
end