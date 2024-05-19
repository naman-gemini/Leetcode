# @param {Integer} num
# @return {Integer[]}
# Recurrence: f(i) = f(i/2) + i % 2
def count_bits(num)
  counts = (0..num).to_a
  counts.map! { |i| i%2 + counts[i/2] }
end