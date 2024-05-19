class Node
  attr_accessor :key, :val, :next, :prev
  
  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end
end

# We're using a doubly ended linked list and a hash table as data structures
# The benefit of dlist is you can delete an element just by it's reference and not have to
# traverse and search for it. References can be stored in the hash table.
# 
# Elements are inserted in front and removed from end.
#
class LRUCache
  attr_accessor :cache, :count, :capacity, :head, :tail

=begin
    :type capacity: Integer
=end
  def initialize(capacity)
    @cache = {} # hash for O(1) access to nodes
    @count = 0 # elements in doubly linked list (excluding head and tail)
    @capacity = capacity

    # dummy nodes
    @head = Node.new # head of dlist (nil node)
    @tail = Node.new # tail of dlist (nil node)
    
    # initial dlist
    @head.next = @tail
    @tail.prev = @head
  end


=begin
  :type key: Integer
  :rtype: Integer
=end
  def get(key)
    return -1 unless @cache.key?(key)

    node = @cache[key]
    # move found node to front of dlist
    move_to_front(node)
    node.val
  end

  def move_to_front(node)
    # remove node from it's current position
    node_prev = node.prev
    node_next = node.next
    node_prev.next = node_next
    node_next.prev = node_prev

    # insert in front
    old_front = @head.next
    node.next = old_front
    node.prev = @head
    old_front.prev = node
    @head.next = node
  end


=begin
  :type key: Integer
  :type value: Integer
  :rtype: Void
=end
  def put(key, value)
    node = @cache[key]

    if node
      # update value
      node.val = value
      # move node to front
      move_to_front(node)
    else
      node = if @count < @capacity
            insert_in_front(key, value)
          else
            # remove last node's key from cache
            @cache.delete(@tail.prev.key)
            remove_from_rear
            @count -= 1

            insert_in_front(key, value)
          end
      @cache[key] = node
      @count += 1
    end
  end

  def insert_in_front(key, value)
    node = Node.new(key, value)
    old_front = @head.next

    node.next = old_front
    node.prev = @head

    old_front.prev = node
    @head.next = node
    node
  end

  def remove_from_rear
    prev = @tail.prev.prev
    prev.next = @tail
    @tail.prev = prev
  end

  def print
    puts "*" * 50
    node = @head.next
    while node != @tail
      puts node.key
      node = node.next
    end
  end

end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)

obj = LRUCache.new(2)
obj.put(1,1)
obj.put(2,2)
puts obj.get(1)

obj.put(3,3)
puts obj.get(2)
obj.put(4,4)
puts obj.get(1)
puts obj.get(3)
puts obj.get(4)