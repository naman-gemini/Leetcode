# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} headA
# @param {ListNode} headB
# @return {ListNode}
def getIntersectionNode(headA, headB)
  return if headA.nil? || headB.nil?
  
  len_a = find_length(headA)
  len_b = find_length(headB)

  diff = len_a - len_b

  curr_a = headA
  curr_b = headB

  if diff > 0 # a is greater;
    while curr_a.next && diff > 0
      curr_a = curr_a.next
      diff -= 1
    end
  else # b is greater
    diff = -diff
    while curr_b.next && diff > 0
      curr_b = curr_b.next
      diff -= 1
    end
  end

  while curr_a != curr_b
    curr_a = curr_a.next
    curr_b = curr_b.next
  end
  
  curr_a
end

def find_length(itr)
  len = 1
  while itr.next
    itr = itr.next
    len += 1
  end
  len
end