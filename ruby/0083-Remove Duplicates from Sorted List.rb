# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
  curr = head
  while curr && curr.next
    if curr.val == curr.next.val
      curr.next = curr.next.next
    else
      curr = curr.next
    end
  end
  head
end