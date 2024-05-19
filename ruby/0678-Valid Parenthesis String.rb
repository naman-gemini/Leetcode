# @param {String} s
# @return {Boolean}
# Nice explanation: https://leetcode.com/problems/valid-parenthesis-string/discuss/107577/Short-Java-O(n)-time-O(1)-space-one-pass
def check_valid_string(s)
  lo = 0
  hi = 0

  s.each_char do |c|
    if c == '('
      lo += 1
      hi += 1
    elsif c == ')'
      lo -= 1 if lo > 0
      hi -= 1
    else
      lo -= 1 if lo > 0
      hi += 1
    end

    return false if hi < 0
  end

  lo == 0
end