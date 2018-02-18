require_relative '../node'


def main(root)
  create_linked_lists([], 0, root)
end

def create_linked_lists(lists, level, node)
  return if node == nil

  list = nil

  if lists.size == level
    list = []
    lists.push(list)
  else
    list = lists[level]
  end

  list.push(node.value)

  create_linked_lists(lists, level + 1, node.left)
  create_linked_lists(lists, level + 1, node.right)

  lists
end

puts '####### Recursive Approach #########'
root = SimpleTree.create
list = main(root)
p list

puts '####### Non Recursive Approach #########'
def create_linked_lists(root)
  result = []
  current = [root]

  while !current.empty?
    result.push(current)
    parent = current
    current = []

    parent.each do |node|
      if node.left
        current.push(node.left)
      end

      if node.right
        current.push(node.right)
      end
    end
  end

  result
end

root = SimpleTree.create
lists = create_linked_lists(root)
final = lists.map do |list|
  list.map do |node|
    node.value
  end
end

p final
