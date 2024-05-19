# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}
def serialize(root)
  ans, q = [], []
  q << root

  # level order traversal
  while !q.empty?
    root = q.shift
    ans << (root ? root.val : "null")
    q << root.left if root
    q << root.right if root
  end

  ans.join(',')
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
  nodes = data.split(',').map { |t| t == "null" ? nil : t.to_i }
  root = TreeNode.new(nodes[0])
  q = [root]
  build_tree(nodes, q)
  root
end

def build_tree(nodes, q)
  i = 1
  while !q.empty?
    node = q.shift
    # set left node
    if nodes[i]
      node.left = TreeNode.new(nodes[i])
      q << node.left
    end
    i += 1

    # set right node
    if nodes[i]
      node.right = TreeNode.new(nodes[i])
      q << node.right
    end
    i += 1
  end
end


# Your functions will be called as such:
# deserialize(serialize(data))