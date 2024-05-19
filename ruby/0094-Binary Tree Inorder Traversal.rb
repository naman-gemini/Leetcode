# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
  helper(root, [])
end

def helper(root, output)
  return output if root.nil?
  helper(root.left, output)
  output << root.val
  helper(root.right, output)
  output
end