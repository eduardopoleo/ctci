require_relative '../node'

def minimal_tree(a)
  minimal_search_tree(a, 0, a.length - 1)
end

def minimal_search_tree(array, start, finish)
  return if start > finish

  mid = (start + finish) / 2
  node = Node.new(array[mid])

  node.left = minimal_search_tree(array, start, mid - 1)
  node.right = minimal_search_tree(array, mid + 1, finish)

  node
  # current node will be connected with the parent
end

a = (0..10).to_a

root = minimal_tree(a)

def in_order_transversal(node)
  return if node == nil
  in_order_transversal(node.left)
  node.visit
  in_order_transversal(node.right)
end

in_order_transversal(root)

# find the middle in the array
# fill left branch
  # move backwars from the array and add 2 nodes
# fill rigth branch
# NOTE: very similar to merge sort Algorithms week1.
