# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  return nil if preorder.empty?
  
  node = TreeNode.new(preorder.first)
  i = inorder.index(preorder.first)
  node.left = build_tree(preorder[1..i], inorder[0...i])
  node.right = build_tree(preorder[i+1..-1], inorder[i+1..-1])
  
  node
end