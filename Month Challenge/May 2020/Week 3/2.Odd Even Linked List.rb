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
# using 2 variables for moving even and odd
def odd_even_list(head)
  return if head.nil?

  odd = head
  even = even_head = head.next

  while even && even.next
    # append next odd to odd chain
    odd.next = even.next
    # iterate odd variable
    odd = odd.next
    # append next even to even chain
    even.next = odd.next
    # iterate even variable
    even = even.next
  end

  odd.next = even_head
  head
end