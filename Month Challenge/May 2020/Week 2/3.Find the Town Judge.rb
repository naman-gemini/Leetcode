# @param {Integer} n
# @param {Integer[][]} trust
# @return {Integer}
def find_judge(n, trust)
  hsh = (1..n).each_with_object({}) { |num, hsh| hsh[num] = true } # everyone can be judge initially
  count = (1..n).each_with_object({}) { |num, hsh| hsh[num] = 0 } # nobody trust anyone initially

  trust.each do |arr|
    hsh[arr[0]] = false # this person can't be judge anymore
    count[arr[1]] += 1 # one more person trusts this person
  end

  (1..n).each do |person|
    return person if hsh[person] && count[person] == n - 1
  end

  -1
end