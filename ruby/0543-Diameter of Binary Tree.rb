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
#
# NOTE: This depth is actually height in real sense. Depends on how you use the definition.
# As logically depth(root) should be 0 or 1, it's the height we're calculating here.
#
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

  # update ans when depth is being calculated (for opimized solution)
  @ans = [@ans, left + right].max

  #[left, right].max + 1
  left + right + 1
end