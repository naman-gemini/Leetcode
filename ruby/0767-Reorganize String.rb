# @param {String} s
# @return {String}
def reorganize_string(s)
  hsh = tally(s)
  output = []
  loop do
    break if hsh.keys.empty?
    char = get_max(hsh, output[-1])
    return '' if char.nil?
    output << char
    if hsh[char] == 1
      hsh.delete(char)
    else
      hsh[char] -= 1
    end
  end
  output.join
end

# this ideally should be done by a max heap
def get_max(hsh, last_char)
  hsh = hsh.reject { |k, v| k == last_char }
  return if hsh.empty?
  max_val = hsh.max_by { |_, v| v }.last
  max_keys = hsh.select { |_, v| v == max_val }.keys
  return max_keys.first if last_char.nil?
  max_keys.find { |t| t != last_char }
end

def tally(s)
  hsh = {}
  s.each_char do |char|
    hsh[char] ||= 0
    hsh[char] += 1
  end
  hsh
end

puts reorganize_string("aaabc")