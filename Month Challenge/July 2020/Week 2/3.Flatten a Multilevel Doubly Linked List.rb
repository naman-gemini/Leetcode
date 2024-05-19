# Definition for a Node.
# class Node
#     attr_accessor :val, :prev, :next, :child
#     def initialize(val=nil, prev=nil, next_=nil, child=nil)
#         @val = val
#         @prev = prev
#         @next = next_
#         @child = child
#     end
# end

# @param {Node} root
# @return {Node}
def flatten(root)
  return nil if root.nil?

  head = root
  stack = []
  prev_root = nil

  # using root as the iterator
  while root
    if root.child
      stack << root.next if root.next
      prev = root
      root = root.child
      root.prev = prev
      prev.next = root
      prev.child = nil
    else
      prev_root = root # to keep track of last node when we reach the end
      root = root.next
    end
  end

  while !stack.empty?
    root = prev_root
    node = stack.pop
    root.next = node
    node.prev = root
    root = node
    while root
      prev_root = root
      root = root.next
    end
  end

  head
end