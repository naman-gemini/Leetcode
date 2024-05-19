# @param {String} path
# @return {String}
def simplify_path(path)
  arr = ['/']
  i = 0
  word = []
  while i < path.size
    i += 1 while path[i] == '/'

    while path[i] != '/' && i < path.size
      word << path[i]
      i += 1
    end

    if path[i] == '/' || i == path.size
      word_str = word.join
      
      if word_str == '..'
        arr.pop if arr.size > 1
      elsif word_str == '.'
        # do nothing with arr
      else
        arr << word_str unless word_str == ''
      end

      word = []
    end

    i += 1
  end
  "/#{arr[1..-1].join('/')}"
end

puts simplify_path("/a/../../b/../c//.//")