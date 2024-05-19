# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)
  @number = nil
  @count = k
  inorder(root)
  @number
end

def inorder(root)
  return if root.nil?

  inorder(root.left)
  @count -= 1
  @number = root.val if @count == 0
  inorder(root.right)
end

# This approach is O(n). 
# For O(log n) approach - https://www.geeksforgeeks.org/find-k-th-smallest-element-in-bst-order-statistics-in-bst/