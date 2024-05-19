# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[][]}
def zigzag_level_order(root)
  current_level, next_level, ans = [], [], []
  left_to_right = true

  current_level << root

  while current_level.any?
    level_ans = []
    level_ans << current_level.pop while current_level.any?
    ans << level_ans.map(&:val)

    level_ans.each do |node|
      if left_to_right
        next_level << node.left
        next_level << node.right
      else
        next_level << node.right
        next_level << node.left
      end
    end

    left_to_right = !left_to_right # change direction
    current_level = next_level.compact
    next_level = []
  end
  ans
end