# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  a = a.chars.reverse
  b = b.chars.reverse

  i, carry = 0, 0
  ans = []

  while a[i] || b[i]
    val = a[i].to_i + b[i].to_i + carry
    if val == 2
      carry = 1
      val = 0
    elsif val == 3
      carry = 1
      val = 1
    else
      carry = 0
    end
    ans << val
    i += 1
  end
  ans << 1 if carry == 1
  ans.reverse.join
end

puts add_binary("1111", "1111")