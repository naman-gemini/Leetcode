# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} preorder
# @return {TreeNode}
#
# O(n log n) soln
# We have already established in problem 105 how to construct a Binary Tree from preorder and inorder traversal
#
# We can further improve to O(n) as it's a BST and not just a binary tree
# Approach: https://www.geeksforgeeks.org/construct-bst-from-given-preorder-traversa/
# But it's quite tricky and it's better to remember one intuitive approach for interviews
#
def bst_from_preorder(preorder)
  inorder = preorder.sort

  build_tree(preorder, inorder)
end

def build_tree(preorder, inorder)
  return nil if preorder.empty?
  
  node = TreeNode.new(preorder.first)
  i = inorder.index(preorder.first)
  node.left = build_tree(preorder[1..i], inorder[0...i])
  node.right = build_tree(preorder[i+1..-1], inorder[i+1..-1])
  
  node
end