# Definition for Node.
# class Node
#     attr_accessor :val, :left, :right, :next
#     def initialize(val)
#         @val = val
#         @left, @right, @next = nil, nil, nil
#     end
# end

# @param {Node} root
# @return {Node}
def connect(root)
  return if root.nil?

  root.left.next = root.right if root.left
  root.right.next = root.next.left if root.right && root.next
  
  connect(root.left)
  connect(root.right)

  root
end