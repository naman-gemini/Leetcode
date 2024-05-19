# @param {String} num
# @param {Integer} k
# @return {String}
# Algo: Iterate through number. If current number is lesser than previous number
# then remove previous number from the answer.
#
# We can use a simple stack to remove and add characters
def remove_kdigits(num, k)
  stack = []

  num.each_char do |c|
    while k > 0 && !stack.empty? && c < stack[-1]
      stack.pop
      k -= 1
    end
    stack.push(c)
  end

  ans = stack.join
  ans = ans[0...-k] if k > 0
  ans.to_i.to_s # handling leading zeroes
end

puts remove_kdigits("10", 2)