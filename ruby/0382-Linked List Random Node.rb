# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
class Solution

=begin
  :type head: ListNode
=end
  def initialize(head)
  	@arr = []
  	while head
  		@arr << head.val
  		head = head.next
  	end
  end


=begin
  :rtype: Integer
=end
  def get_random()
     @arr.sample
  end


end

# Your Solution object will be instantiated and called as such:
# obj = Solution.new(head)
# param_1 = obj.get_random()