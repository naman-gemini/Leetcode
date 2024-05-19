# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  (digits.size - 1).downto(0).each do |i|
    if digits[i] == 9
      digits[i] = 0
    else
      digits[i] += 1
      return digits
    end
  end
  # if it has reached here, that means first digit was also 9
  digits[0] = 0
  digits.unshift(1)
end