# @param {String} digits
# @return {String[]}
MAP = {
  2 => 'a'..'c',
  3 => 'd'..'f',
  4 => 'g'..'i',
  5 => 'j'..'l',
  6 => 'm'..'o',
  7 => 'p'..'s',
  8 => 't'..'v',
  9 => 'w'..'z'
}
def letter_combinations_iterative(digits)
  return [] if digits == ''
  return MAP[digits[0].to_i].to_a if digits.size == 1

  digits.chars[1..-1].inject(MAP[digits[0].to_i].to_a) do |product, char| 
    product.product(MAP[char.to_i].to_a)
  end.map { |t| t.join('')}
end

def letter_combinations_recursive(digits)
  return [] if digits == ''

  @output = []
  recurse(digits.chars.map(&:to_i), 0, "")
  @output
end

def recurse(arr, index, str)
  if index == arr.size
    @output << str
    return
  end

  MAP[arr[index]].each do |char|
    recurse(arr, index + 1, str + char)
  end
end

puts letter_combinations("23")