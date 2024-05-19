# @param {String} s
# @param {Integer[][]} shift
# @return {String}
def string_shift(s, shift)
  count = 0
  shift.each do |sh|
    count += sh.last if sh.first == 0
    count -= sh.last if sh.first == 1
  end
  s.chars.rotate(count).join
end