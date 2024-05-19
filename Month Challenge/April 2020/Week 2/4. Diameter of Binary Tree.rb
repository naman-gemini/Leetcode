# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def diameter_of_binary_tree(root)
  @ans = 0
  return @ans if root.nil?

  depth(root)
  @ans
end

def depth(root)
  return 0 if root.nil?

  left = depth(root.left)
  right = depth(root.right)
  @ans = [@ans, left + right].max

  [left, right].max + 1
end