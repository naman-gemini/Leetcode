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
  return head if head.nil? || head.next.nil?
  first = head

  (k-1).times do
    if first.next.nil?
      return head
    end
    first = first.next
  end

  curr = head
  last_k = nil

  while curr do
    first_k = curr
    # puts "first_k=#{first_k.val}"
    prev = nil
    flag = true

    temp = curr
    (k-1).times do
      temp = temp.next
      if temp.nil?
        flag = false
        break
      end
    end

    # reverse k nodes
    if flag
      k.times do
        break if curr.nil?
        # puts "curr=#{curr.val}"
        nextNode = curr.next
        curr.next = prev
        prev = curr
        curr = nextNode
      end
    else
      last_k.next = curr if last_k
      curr = nil
    end

    # puts "last_k=#{last_k.val}" if last_k
    last_k.next = prev if last_k && flag
    last_k = first_k
  end
  first
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
# l3 = ListNode.new(3)
# l4 = ListNode.new(4)
# l5 = ListNode.new(5)
# l6 = ListNode.new(6)
l1.next = l2
# l2.next = l3
# l3.next = l4
# l4.next = l5
# l5.next = l6
print_list(reverse_k_group(l1, 3))