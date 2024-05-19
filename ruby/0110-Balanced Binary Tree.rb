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
# @return {Boolean}
#
# This will take O(n log n) time as we're calling height(node) -> O(log n) operation on each node
#
def is_balanced(root)
  return true if root.nil?

  left_height = height(root.left)
  right_height = height(root.right)

  (left_height - right_height).abs <= 1 && is_balanced(root.left) && is_balanced(root.right)
end

def height(root)
  return -1 if root.nil? # leaf node has 0 height

  [height(root.left), height(root.right)].max + 1
end