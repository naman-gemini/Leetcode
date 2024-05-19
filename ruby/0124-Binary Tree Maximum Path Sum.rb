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
def max_path_sum(root)
  @max_sum = -Float::INFINITY
  path_sum(root)
  @max_sum
end

def path_sum(root)
  return 0 if root.nil?

  left = [0, path_sum(root.left)].max
  right = [0, path_sum(root.right)].max
  @max_sum = [@max_sum, left + right + root.val].max
  [left, right].max + root.val
end