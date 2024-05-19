# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  hsh = Hash.new(0)
  s.chars.each_with_index do |char, i|
    if hsh[char] == 0 # first occurence
      hsh[char] = [1, i]
    else
      hsh[char][0] += 1
    end
  end

  hsh.each { |_, v| return v[1] if v[0] == 1 }
  return -1
end