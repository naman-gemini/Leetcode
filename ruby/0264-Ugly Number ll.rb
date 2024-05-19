# @param {Integer} n
# @return {Integer}
# Nice Explanation: https://www.youtube.com/watch?v=kSDI_iOiGQY
def nth_ugly_number(n)
  ugly = [1] # array to keep ugly numbers
  idx2, idx3, idx5 = 0, 0, 0
  count = 0

  while count < n
    nxt = [ugly[idx2] * 2, ugly[idx3] * 3, ugly[idx5] * 5].min # this generates the next ugly number
    
    idx2 += 1 if nxt == ugly[idx2] * 2
    idx3 += 1 if nxt == ugly[idx3] * 3
    idx5 += 1 if nxt == ugly[idx5] * 5

    count += 1
    ugly[count] = nxt
  end
  ugly[n - 1]
end