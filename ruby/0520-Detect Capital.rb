# @param {String} word
# @return {Boolean}
def detect_capital_use(word)
  word.chars.all? { |char| char == char.upcase } ||
    word.chars.all? { |char| char == char.downcase } ||
      (word[0] == word[0].upcase && word.chars[1..-1].all? { |char| char == char.downcase } )
end