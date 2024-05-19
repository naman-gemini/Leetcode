# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  return 0 if needle.size == 0
  0.upto(haystack.size - 1).each do |i|
    
    return -1 if i + needle.size > haystack.size

    if haystack[i] == needle[0]
      flag = true
      j = i
      needle.each_char do |char|
        if char != haystack[j]
          flag = false
          break
        end
        j += 1
      end
      return i if flag
    end
  end
  -1
end

puts str_str("javaa", "aa")