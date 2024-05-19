# @param {String} s
# @return {String}
def shortest_palindrome(s)
  # get largest palindrome from start of the string
  last = largest_palindrome(s)
  s[(last + 1)..(s.size - 1)].reverse + s
end

# largest palindrome from the start of the string (s[0..j] is palindrome)
def largest_palindrome(s)
  j = s.size - 1
  while j > 0
    if palindrome?(s, j)
      return j
    else
      j -= 1
    end
  end
  j
end

# checks if s[0..last] is a palindrome or not
def palindrome?(s, last)
  substr = s[0..last]
  substr == substr.reverse
end