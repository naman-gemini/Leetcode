# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
  return head if head.nil? || head.next.nil? || k == 0 || k == 1

  new_head = get_kth_node(head, k)
  curr = head

  while curr && has_k_nodes?(curr, k + 1) do
    prev = get_kth_node(curr, k + 1)
    
    # reverse k nodes
    k.times do
      next_node = curr.next
      curr.next = prev
      prev = curr
      curr = next_node
    end
  end
  new_head
end

def has_k_nodes?(curr, k)
  (k-1).times do
    curr = curr.next
    return false if curr.nil?
  end
  true
end

def get_kth_node(head, k)
  (k-1).times do
    return head if head.next.nil?
    head = head.next
  end
  head
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

l1 = ListNode.new(1)
l2 = ListNode.new(2)
l3 = ListNode.new(3)
l4 = ListNode.new(4)
l5 = ListNode.new(5)
l6 = ListNode.new(6)
l1.next = l2
l2.next = l3
l3.next = l4
l4.next = l5
l5.next = l6
print_list(reverse_k_group(l1, 3))