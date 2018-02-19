require_relative '../node'

root_not_binary = SimpleTree.create
root_binary = BinarySearchTree.create

## Approach 1 inserting values into an array as you go along
def ordered?(list)
  list.each_with_index do |_value, i|
    if list[i + 1] && (list[i + 1] < list[i])
      return false
    end
  end

  return true
end

def in_order_search(node, list)
  return if node == nil

  in_order_search(node.left, list)
  list << node.value
  in_order_search(node.right, list)

  list
end

puts '## Not Binary. Array approach ##'
list = in_order_search(root_not_binary, [])
p ordered?(list)

puts '## Binary. Array approach ##'
list = in_order_search(root_binary, [])
p ordered?(list)

## Approach 2 without creating the array checking on the fly from the last
# visited node
def in_order_search2(node)
  return true if node == nil

  return false if !in_order_search2(node.left)

  if $last_seen != nil && ($last_seen > node.value)
    return false
  end
  # it has to be global otherwise we can't keep track of the last_seen
  # value when we start backtracking.
  $last_seen = node.value

  return false if !in_order_search2(node.right)

  return true
end

puts '## Not Binary. last seen should always be smaller  ##'
$last_seen = nil
p in_order_search2(root_not_binary)

puts '## Binary. last seen should always be smaller  ##'
$last_seen = nil
p in_order_search2(root_binary)

## Aproach 3 using the binary search tre definition min/max
# n.left.value < n.value < n.right.value


def in_order_search3(node, max, min)
  return true if node == nil

  if max && (node.value > max)
    return false
  end

  if min && (node.value < min)
    return false
  end

  if !in_order_search3(node.left, node.value, min) ||
      !in_order_search3(node.right, max, node.value)
    return false
  end

  return true
end

puts '## Not Binary. min max  ##'
p in_order_search3(root_not_binary, nil, nil)

puts '## Not Binary. min max  ##'
p in_order_search3(root_binary, nil, nil)
