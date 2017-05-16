require_relative './linked_list'

# the list is a singly linked list. Nodes have no reference to their previous
# nodes
def delete_node(list, id)
  ## Iterative with a runner that goes one step forward ###

  current = list.head
  runner = current.next

  while runner != nil
    if runner.id == id
      current.next = runner.next
      break
    end

    current = current.next
    runner = runner.next
  end

  list

  ### Is there a recursive solution? ###
end


### given only access to that node ###

def delete_node(node)
  ## just copy the information of the next node and then cut it out
  node.id = node.next.id
  node.next = node.next.next
end

node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)
node5 = Node.new(5)

node1.append(node2)
node2.append(node3)
node3.append(node4)
node4.append(node5)

delete_node(node1)

p node1
