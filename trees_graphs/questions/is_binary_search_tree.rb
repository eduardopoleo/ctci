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
$last_seen = nil
def in_order_search2(node)
  return true if node == nil

  in_order_search2(node.left)

  if $last_seen != nil && ($last_seen > node.value)
    return false
  end

  $last_seen = node.value

  in_order_search2(node.right)

  return true
end

puts '## Not Binary. last seen should always be smaller  ##'
p in_order_search2(root_not_binary)

puts '## Binary. last seen should always be smaller  ##'
p in_order_search2(root_not_binary)
