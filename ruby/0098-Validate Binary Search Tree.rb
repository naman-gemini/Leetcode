# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Boolean}
INFINITY = 1.0/0

def is_valid_bst(root)
  helper(root, -INFINITY, INFINITY)
end

def helper(root, min, max)
  return true if root.nil?
  root.val > min && root.val < max && helper(root.left, min, root.val) && helper(root.right, root.val, max)
end