# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
  return if head.nil?
  
  len = length(head)
  k = k % len
  return head if k == 0

  # go to len - k (new head)
  new_head = head
  prev = nil
  count = 0
  while new_head && count < len - k
    count += 1
    prev = new_head
    new_head = new_head.next
  end

  # go to end of list and append head to it
  curr = new_head
  while curr.next
    curr = curr.next
  end
  curr.next = head

  # point node previous to new_head to null
  prev.next = nil
  new_head
end

def length(head)
  count = 0
  while head
    count += 1
    head = head.next
  end
  count
end