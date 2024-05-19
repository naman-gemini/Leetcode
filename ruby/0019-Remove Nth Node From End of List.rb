# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  back_node = head
  forward_node = head
  n.times { forward_node = forward_node.next }
  while forward_node && forward_node.next
    back_node = back_node.next
    forward_node = forward_node.next
  end
  if back_node == head && forward_node.nil? # first node itself has to be deleted
    head = head.next
  else
    back_node.next = back_node.next.next
  end
  head
end

def print_list(head)
  while head
    puts head.val
    head = head.next
  end
end

class ListNode
  attr_accessor :val, :next
  def initialize(val)
      @val = val
      @next = nil
  end
end

l1 = ListNode.new(1)
l2 = ListNode.new(2)
l3 = ListNode.new(3)
l4 = ListNode.new(4)
l5 = ListNode.new(5)
l1.next = l2
l2.next = l3
l3.next = l4
l4.next = l5
# print_list(l1)
x = remove_nth_from_end(l1, 5)
print_list(x)