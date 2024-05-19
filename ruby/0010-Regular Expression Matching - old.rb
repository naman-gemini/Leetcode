# @param {String} s
# @param {String} p
# @return {Boolean}
# Algo - Stack Approach (Ultimately fails)
def is_match(s, p)
  return true if p == ".*"

  star_flag = false

  p_stack = []
  p.each_char.with_index do |char, index|
    next if char == '*'
    if p[index + 1] == '*'
      p_stack.unshift("#{char}*")
    else
      p_stack.unshift(char)
    end
  end

  s_stack = s.reverse.chars

  while p_stack.any? && s_stack.any?
    # element at top of stack
    curr = p_stack.pop

    # curr is letter
    if curr.size == 1 && !['.', '*'].include?(curr)
      return false if curr != s_stack.pop
    end

    # curr is . Always matches, until there's something in stack.
    if curr == '.'
      return false if s_stack.pop.nil?
    end

    # curr has * but no .
    if curr.include?('*') && !curr.include?('.')
      star_flag = true
      letter = curr[0]
      s_stack.pop while s_stack.last == letter
    end

    # curr has * and .
    if curr == '.*'
      star_flag = true
      s_stack.pop while s_stack.any?
    end
  end
  return false if s_stack.any?

  if p_stack.any? && !star_flag
    return true if p_stack.all? { |t| t.include?('*') } # * can mean zero instances
    return false
  end

  # some letters still left after .* covered everything from s_stack
  if p_stack.any? && star_flag
    i, j = 0, s.size - 1
    while i < p_stack.size
      if p_stack[i].include?('*') # ignore any more * elements, as they're already covered in .*
        i += 1
        next
      end
      if p_stack[i] == '.'
        return false if j < 0
        j -= 1
      else
        return false if p_stack[i] != s[j]
        j -= 1
      end
      i += 1
    end
  end
  true
end

# puts is_match("aa", "a") # false
# puts is_match("aa", "a*") # true
# puts is_match("ab", ".*") # true
# puts is_match("aab", "c*a*b") # true
# puts is_match("mississippi", "mis*is*p*.") # false
# puts is_match("aabb", ".*.*bb") # true
# puts is_match("a", "ab*a") # false
puts is_match("aaa", "a*a") # true
puts is_match("a", "ab*") # true
puts is_match("a", ".*..a*") # false
puts is_match("ab", ".*..") # true
puts is_match("aasdfasdfasdfasdfas", "aasdf.*asdf.*asdf.*asdf.*s") # true