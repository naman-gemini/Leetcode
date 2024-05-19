# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  return nil if head.nil?
  return head if head.next.nil?

  first = head
  second = head.next
  third = second.next

  # set head to second
  head = second

  # reverse first 2
  second.next = first
  first.next = swap_pairs(third) # recursively swap rest

  head
end

def swap_pairs_iterative(head)
  return nil if head.nil?
  return head if head.next.nil?
  
  new_head = head.next
  curr = head
  prev = nil
  while !curr.nil? && !curr.next.nil?
    second = curr.next
    third = second.next
    second.next = curr
    curr.next = third
    prev.next = second if prev
    prev = curr
    curr = third
  end
  new_head
end

class ListNode
  attr_accessor :val, :next
  def initialize(val)
      @val = val
      @next = nil
  end
end

def print_list(head)
  while head
    puts head.val
    head = head.next
  end
end

l1 = ListNode.new(1)
l2 = ListNode.new(2)
l3 = ListNode.new(3)
l4 = ListNode.new(4)
l1.next = l2
l2.next = l3
l3.next = l4
x = swap_pairs_iterative(l1)
print_list(x)