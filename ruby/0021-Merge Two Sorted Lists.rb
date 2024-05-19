# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists_with_new_list(l1, l2)
  head = ListNode.new(nil)
  curr = head
  while l1 || l2
    if l1 && (l1.val < l2.val rescue true)
      new_node = ListNode.new(l1.val)
      l1 = l1.next
    else
      new_node = ListNode.new(l2.val)
      l2 = l2.next
    end
    curr.next = new_node
    curr = new_node
  end
  head.next
end

# in place
def merge_two_lists(l1, l2)
  return l1 if l2.nil?
  return l2 if l1.nil?

  if l1.val < l2.val
    l1.next = merge_two_lists(l1.next, l2)
    return l1
  else
    l2.next = merge_two_lists(l1, l2.next)
    return l2
  end
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

l1 = ListNode.new(200)
# l2 = ListNode.new(300)
# l3 = ListNode.new(400)
l4 = ListNode.new(1)
# l5 = ListNode.new(32)
# l6 = ListNode.new(10)
# l1.next = l2
# l2.next = l3
# l4.next = l5
# l5.next = l6

print_list(merge_two_lists(l1, l4))