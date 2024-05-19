# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Boolean}
def is_palindrome(head)
  # goto mid of the list and push elements in stack
  stack = []
  slow, fast = head, head

  # handle size 1
  return true if fast.nil?

  # handle size 2
  return slow.val == fast.val if fast.next.nil?

  # handle size >= 3
  while fast && fast.next
    stack << slow.val
    slow = slow.next
    fast = fast.next.next
  end

  slow = slow.next if fast # odd sized list

  while !stack.empty? && slow
    return false if stack.pop != slow.val
    slow = slow.next
  end
  true
end