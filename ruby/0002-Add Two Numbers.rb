# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# # @return {ListNode}

# l1 = ListNode.new(2)
# l1.next = ListNode.new(4)
# l1.next.next = ListNode.new(3)

# l2 = ListNode.new(5)
# l2.next = ListNode.new(6)
# l2.next.next = ListNode.new(4)

def add_two_numbers(l1, l2)
  head = ListNode.new(0)
  curr = head
  carry = 0
  while l1 || l2 do
    sum = (l1.val rescue 0) + (l2.val rescue 0) + carry
    carry = sum / 10
    curr.next = ListNode.new(sum%10)
    curr = curr.next
    l1 = l1.next unless l1.nil?
    l2 = l2.next unless l2.nil?
  end
  curr.next = ListNode.new(carry) if carry > 0
  return head.next
end

# add_two_numbers(l1, l2)