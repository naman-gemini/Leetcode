# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  k = lists.size
  return nil if k == 0
  gap = 2
  Math.log(k, 2).ceil.times do
    0.step(k, gap) do |i|
      lists[i] = merge_two_lists(lists[i], lists[i + gap / 2])
    end
    gap *= 2
  end
  lists[0]
end

# in place (don't use extra space)
def merge_two_lists(l1, l2)
  return l1 if l2.nil?
  head = ListNode.new(0) # dummy node
  curr = head
  while l1 || l2
    if l1 && (l1.val < l2.val rescue true)
      curr.next = l1
      l1 = l1.next
    else
      curr.next = l2
      l2 = l2.next
    end
    curr = curr.next
  end
  head.next
end

class ListNode
  attr_accessor :val, :next
  def initialize(val)
      @val = val
      @next = nil
  end
end

def print_list(head)
  while head
    puts head.val
    head = head.next
  end
end


# 1, 3
# 2, 5

l1 = ListNode.new(4)
l2 = ListNode.new(8)
# l3 = ListNode.new(400)
l4 = ListNode.new(1)
l5 = ListNode.new(2)
# l6 = ListNode.new(10)
l1.next = l2
# l2.next = l3
l4.next = l5
# l5.next = l6
print_list(merge_two_lists(l1, l4))