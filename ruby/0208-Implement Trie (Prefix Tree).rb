class TrieNode
  SIZE = 26

  attr_accessor :is_end, :links

  # NOTE: links can be stored as a hash as well (easier access)
  def initialize
    @is_end = false # denotes if this is the last letter of the word
    @links = Array.new(SIZE) # stores links to next letters of the word
  end

  # some helper methods

  # does this node contain a char
  def contains_key?(key)
    !links[key.ord - 'a'.ord].nil?
  end

  # get link to next char
  def get(key)
    links[key.ord - 'a'.ord]
  end

  # set link of a char to next char of the word
  def insert(key)
    links[key.ord - 'a'.ord] = TrieNode.new
  end

  # this should be done in this class for separation of concerns
  def set_end
    @is_end = true
  end

  def is_end?
    is_end
  end
end

class Trie
  attr_accessor :root

=begin
    Initialize your data structure here.
=end
  def initialize()
    @root = TrieNode.new
  end


=begin
    Inserts a word into the trie.
    :type word: String
    :rtype: Void
=end
  def insert(word)
    node = root
    word.each_char do |char|
      node = node.get(char) || node.insert(char)
    end
    node.set_end # this is the last node for the word
  end


=begin
    Returns if the word is in the trie.
    :type word: String
    :rtype: Boolean
=end
  def search(word)
    node = get_last_node(word)
    !node.nil? && node.is_end?
  end


=begin
    Returns if there is any word in the trie that starts with the given prefix.
    :type prefix: String
    :rtype: Boolean
=end
  def starts_with(prefix)
    node = get_last_node(prefix) # this node doesn't need to be a an end node
    !node.nil?
  end

  # searches for the node that goes along with the string (can be complete word or just the prefix)
  # returns last node on the path
  # returns nil if the path breaks
  def get_last_node(str)
    node = root
    str.each_char do |char|
      return nil unless node.get(char)
      node = node.get(char)
    end
    node
  end


end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)