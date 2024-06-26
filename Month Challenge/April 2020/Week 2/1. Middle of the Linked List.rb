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
def middle_node(head)
  slow, fast = head, head
  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
  end
  slow
end