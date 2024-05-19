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
# @return {Integer}
#
# The key idea here is to traverse through each level in a BFS manner (using queue)
# and storing indexes of node along with the nodes. Index of child of node with index i is
# 2*i and 2*i + 1; We can utilize these indexes to find the width of the level
#
def width_of_binary_tree(root)
  return 0 if root.nil?

  max = 1 # min answer is 1 if root is not null
  q = [[root, 1], nil] # root has index 1
  while !q.empty?
    node, idx = q.shift
    if node.nil? # level has ended
      break if q.empty? # only nil in the queue
      # right most non nil element's index - left most non nil element's index
      width = q.last[1] - q.first[1] + 1
      max = [max, width].max
      q << nil
    else
      q << [node.left, 2 * idx] if node.left
      q << [node.right, 2 * idx + 1] if node.right
    end
  end
  max
end