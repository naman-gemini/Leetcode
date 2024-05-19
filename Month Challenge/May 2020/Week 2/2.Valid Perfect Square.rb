# @param {Integer} num
# @return {Boolean}
# Complexity: O(sqrt(n))
def is_perfect_square(num)
  i = 0
  while i * i <= num
    return true if i * i == num
    i += 1
  end
  false
end

# Complexity: O(log n)
def is_perfect_square_bsearch(num)
  (0..num).bsearch { |x| x * x >= num } ** 2 == num
end