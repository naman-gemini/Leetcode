# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  hsh = {}
  strs.each do |str|
    sorted_str = str.chars.sort.join
    hsh[sorted_str] ||= []
    hsh[sorted_str] << str
  end
  hsh.values
end