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
# @return {Integer[][]}
def level_order_bottom(root)
  return [] if root.nil?
  q = [root, nil]
  s = []
  current_level = []
  while !q.empty?
    node = q.shift
    if node.nil?
      q << nil if !q.empty?
      s << current_level
      current_level = []
    else
      q << node.left if node.left
      q << node.right if node.right
      current_level << node.val
    end
  end
  s.reverse
end