# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  if p.val < root.val && q.val < root.val
    # find lca in left subtree
    lowest_common_ancestor(root.left, p, q)
  elsif p.val > root.val && q.val > root.val
    # find lca in right subtree
    lowest_common_ancestor(root.right, p, q)
  else
    # one is in left and one is in right. As we're going top down, this should be the lca
    root
  end
end

# Very nice explanation: https://leetcode.com/articles/lowest-common-ancestor-of-a-binary-search-tree/