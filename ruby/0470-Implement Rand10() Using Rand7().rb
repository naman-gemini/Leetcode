# The rand7() API is already defined for you.
# def rand7()
# @return {Integer} a random integer in the range 1 to 7
#
# Algo: Rejection Sampling (https://leetcode.com/problems/implement-rand10-using-rand7/solution/)
#
def rand10()
  r = (rand7() - 1) * 7 + (rand7() - 1)

  if r < 40
    return (r % 10) + 1
  else
    rand10()
  end
end