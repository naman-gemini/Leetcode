# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)
  return if head.nil?

  # handle if val is in the beginning
  while head && head.val == val
    head = head.next
  end

  return if head.nil?

  # this assumes minimum 2 elements
  prev, curr = head, head.next
  while curr
    if curr.val == val
      prev.next = curr.next
    else
      prev = curr
    end
    curr = curr.next
  end
  head
end