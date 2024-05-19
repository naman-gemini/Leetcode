# @param {String} s
# @return {String}
def frequency_sort(s)
  ans = []
  tally = s.chars.each_with_object(Hash.new(0)) { |char, hsh| hsh[char] += 1 }
  tally = tally.sort_by { |_, v| -v }
  tally.each do |arr|
    arr.last.times do
      ans << arr.first
    end
  end
  ans.join
end