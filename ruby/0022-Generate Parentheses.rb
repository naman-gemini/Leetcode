# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  @ans = []
  recurse('', 0, 0, n)
  @ans
end

def recurse(str, open, close, n)
  recurse(str + '(', open + 1, close, n) if open < n
  recurse(str + ')', open, close + 1, n) if open > close
  @ans << str if str.size == 2 * n
end

puts generate_parenthesis(7)