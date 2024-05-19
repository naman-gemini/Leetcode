# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}
def sum_numbers(root)
  @sum = 0
  solve(root, [root.val]) if root
  @sum
end

def solve(root, arr)
  return if root.nil?
  solve(root.left, arr + [root.left.val]) if root.left
  solve(root.right, arr + [root.right.val]) if root.right

  if root.left.nil? && root.right.nil? # leaf node
    mul = 1
    arr.reverse.each do |val|
      @sum += val * mul
      mul *= 10
    end
  end
end