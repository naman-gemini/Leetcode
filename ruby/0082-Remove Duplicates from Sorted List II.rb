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
  dummy = ListNode.new(-1) # dummy node
  dummy.next = head

  prev, curr = dummy, head
  while curr && curr.next
    if curr.val == curr.next.val
      while curr.next && curr.val == curr.next.val
        curr = curr.next
      end
      prev.next = curr.next
    else
      prev = curr
    end
    curr = curr.next
  end
  dummy.next
end