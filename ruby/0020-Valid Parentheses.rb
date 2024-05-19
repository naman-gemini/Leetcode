# @param {String} s
# @return {Boolean}
MAP = {
  ')' => '(',
  '}' => '{',
  ']' => '['
}
def is_valid(s)
  stack = []
  s.each_char do |char|
    stack.push(char) if ['(', '{', '['].include?(char)
    if [')', '}', ']'].include?(char)
      top = stack.pop
      return false if top != MAP[char]
    end
  end
  stack.empty?
end

puts is_valid("()")