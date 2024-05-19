# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
def build_tree(inorder, postorder)
  return if inorder.empty?

  root = postorder.last
  i = inorder.index(root)

  root = TreeNode.new(root)
  root.left = build_tree(inorder[0...i], postorder[0...i])
  root.right = build_tree(inorder[(i + 1)..-1], postorder[i..-2])

  root
end