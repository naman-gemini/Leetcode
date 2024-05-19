# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {ListNode} head
# @return {TreeNode}
#
# There are 3 ways of solving this:
#
# Method 1 - Convert linked list to an array and solve recursively.
# This is the simplest approach. Time - O(n). Space - O(n)
#
def sorted_list_to_bst_arr(head)
  arr = []
  while head
    arr << head.val
    head = head.next
  end

  arr_helper(arr, 0, arr.size - 1)
end

def arr_helper(arr, left, right)
  return if left > right
  mid = (left + right) / 2

  node = TreeNode.new(arr[mid])
  node.left = arr_helper(arr, left, mid - 1)
  node.right = arr_helper(arr, mid + 1, right)
  node
end

# Method 2 - Solve it recursively. Traverse the list to mid. Solve left, solve right recursively.
# Time - O(n log n). Space - O(log n)
#
def sorted_list_to_bst_recursion(head)
  return if head.nil?

  mid = find_mid(head)

  node = TreeNode.new(mid.val)
  return node if mid == head # when there is just one node in the linked list

  node.left = sorted_list_to_bst(head)
  node.right = sorted_list_to_bst(mid.next)
  node
end

# returns mid of the node
# also breaks list in 2 halves - left and right (around mid)
def find_mid(head)
  prev = nil
  slow, fast = head, head
  while fast && fast.next
    prev = slow
    slow = slow.next
    fast = fast.next.next
  end
  prev.next = nil if !prev.nil? # detatch list at mid. But not when list is of size 1 only.
  slow
end

# Method 3 - Inorder simulation. Solve left half first recursively, make a new node, handle right recursively
# Time - O(n). Space - O(log n)
#
def sorted_list_to_bst(head)
  @head = head
  len = find_length(head)
  list_to_bst(0, len - 1)
end

def find_length(head)
  count = 0
  while head
    count += 1
    head = head.next
  end
  count
end

def list_to_bst(left, right)
  return if left > right

  mid = (left + right) / 2

  # recursively form the left half
  l = list_to_bst(left, mid - 1)

  # once left half is traversed, process the current node
  node = TreeNode.new(@head.val)
  node.left = l

  @head = @head.next
  node.right = list_to_bst(mid + 1, right)
  node
end