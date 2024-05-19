# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
  hsh = tally(magazine)
  ransom_note.each_char do |char|
    if hsh[char] > 0
      hsh[char] -= 1
    else
      return false
    end
  end
  true
end

def tally(str)
  str.chars.each_with_object(Hash.new(0)) { |char, hsh| hsh[char] += 1 }
end