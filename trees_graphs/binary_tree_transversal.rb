require_relative './tree'

# Tree
#           10
#      5          20
#   9    18    3     7

# In order transversal => 9, 5, 18, 10, 3, 20, 7

node18 = Node.new(18, [])
node9 = Node.new(9, [])
node5 = Node.new(5, [node9, node18])

node7 = Node.new(7, [])
node3 = Node.new(3, [])
node20 = Node.new(20, [node3, node7])

root = Node.new(10, [node5, node20])

def order_transversal(node)
  if node
    order_transversal(node.left)
    p node.value
    order_transversal(node.right)
  end
end

order_transversal(root)
