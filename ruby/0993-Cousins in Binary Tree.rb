# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} x
# @param {Integer} y
# @return {Boolean}
def is_cousins(root, x, y)
  q = [ {node: root, parent: nil}, nil ] # stores nodes, their parents and level separaters
  while !q.empty?
    node_hash = q.shift

    if node_hash.nil? # previous level has ended
      return true if check?(q, x, y) # check if x and y are cousins for current level
      q << nil unless q.empty?
    else
      node = node_hash[:node]
      q << { node: node.left, parent: node } if node.left
      q << { node: node.right, parent: node } if node.right
    end
  end
  false
end

# check if x and y are cousins
def check?(q, x, y)
  arr = q.select { |h| [x, y].include?(h[:node].val) }
  return false if arr.size != 2
  arr[0][:parent] != arr[1][:parent] # means they're cousins
end

# root = TreeNode.new(1)
# root.left = TreeNode.new(2)
# root.right = TreeNode.new(3)
# root.left.left = TreeNode.new(4)
# puts is_cousins(root, 4, 3)