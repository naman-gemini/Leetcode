# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  j_max = strs.map { |t| t.size }.max
  # puts "j_max: #{j_max}"
  return "" if j_max.nil?
  0.upto(j_max - 1).each do |j|
    flag = true
    1.upto(strs.size - 1).each do |i|
      if (strs[i][j].nil? || strs[i-1][j].nil?) || strs[i][j] != strs[i-1][j]
        if j == 0
          return ""
        else
          return strs[0][0..(j-1)] 
        end
      end
    end
  end
  strs[0]
end

puts longest_common_prefix(["abab","aba",""])