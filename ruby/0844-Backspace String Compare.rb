# @param {String} s
# @param {String} t
# @return {Boolean}
def backspace_compare(s, t)
  process_string(s) == process_string(t)
end

def process_string(str)
  final = []
  str.chars.each do |char|
    if char == '#'
      final.pop
    else
      final << char
    end
  end
  final
end

puts backspace_compare("a#c", "c")