# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} x
# @return {ListNode}
def partition(head, x)
  return head if head.nil?

  before_head = ListNode.new(-1) # dummy node for before head
  after_head = ListNode.new(-1) # dummy node for after head
  before = before_head # this list will keep before nodes
  after = after_head # this list will keep after nodes

  curr = head
  while curr
    if curr.val < x
      before.next = curr
      before = before.next
    else
      after.next = curr
      after = after.next
    end
    curr = curr.next
    after.next = nil # the after list can still be pointing to a node in the list and causing a cycle
  end
  before.next = after_head.next
  before_head.next
end