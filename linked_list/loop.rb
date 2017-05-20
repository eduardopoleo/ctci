require_relative './linked_list'

def loop_finder(head)
  current = head
  runner = head

  while true
    current = current.next
    runner = runner.next.next

    break if current.object_id == runner.object_id
    return "There is no loop" if(runner.nil? || runner.next.nil?)
  end

  current = head

  while current.object_id != runner.object_id
    current = current.next
    runner = runner.next
  end

  current
end

node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)
node5 = Node.new(5)
node6 = Node.new(6)
node7 = Node.new(7)
node8 = Node.new(8)
node9 = Node.new(9)
node10 = Node.new(10)
node11 = Node.new(11)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
node6.next = node7
node7.next = node8
node8.next = node9
node9.next = node10
node10.next = node11
node11.next = node4

p loop_finder(node1)
