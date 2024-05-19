# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} m
# @param {Integer} n
# @return {ListNode}
def reverse_between(head, m, n)
  prev = ListNode.new(-1) # dummy node
  curr = head
  count = 0

  while curr
    count += 1

    if count == m
      temp_head = prev
      temp_end = curr
      while count <= n
        temp = curr.next
        curr.next = prev

        prev = curr
        curr = temp
        count += 1
      end
      temp_head.next = prev
      temp_end.next = curr
    else
      prev = curr
      curr = curr.next
    end
  end
  temp_head.next
end