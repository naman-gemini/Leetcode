# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Integer}
def get_decimal_value(head)
  stack = []
  ans = 0

  while head
    stack << head.val
    head = head.next
  end

  exp = 0
  while !stack.empty?
    ans += stack.pop * (2 ** exp)
    exp += 1
  end
  ans
end