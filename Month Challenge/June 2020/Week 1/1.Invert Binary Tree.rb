# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {TreeNode}
def invert_tree(root)
  if root
    root.left, root.right = root.right, root.left
    invert_tree(root.left)
    invert_tree(root.right)
  end
  root
end