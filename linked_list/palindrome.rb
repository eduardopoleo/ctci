require_relative './linked_list'


def palindrome?(head)
  # current = head
  # runner = head
  # previous = head
  #
  # while current != nil
  #   runner = current
  #   while runner != nil
  #     if runner.next == nil
  #       return false if !(current.id == runner.id)
  #       previous.next = nil
  #     end
  #
  #     previous = runner
  #     runner = runner.next unless runner.nil?
  #   end
  #   current = current.next
  # end
  #
  # true

  # O(N^2) This algoritm is crap... but it's nice to know why it is N^2

  # N + N - 2 + N - 4 + N - 6....1
  # 1 + 2... N - 2, N => It's the sum of the odd number which is equal to N^2
  ###########################################################################

  ### We can just reverse the list and compare it to the original. That would be
  ### only 2 * N or N
  ### We only need to check half of the corresponding lists

  # current = head
  # backwards_head = nil
  #
  # while current != nil
  #   node = Node.new(current.id)
  #   node.next = backwards_head
  #   backwards_head = node
  #
  #   current = current.next
  # end
  #
  # current1 = head
  # current2 = backwards_head
  # runner = head
  #
  # while runner && runner.next != nil
  #   return false if current1.id != current2.id
  #
  #   current1 = current1.next
  #   current2 = current2.next
  #   runner = runner.next.next
  # end
  #
  # return true
  ##############################################################################

  ### without creating an extra list ####
  ### this is a better solution as it saves space but the runtime complexity is the same.

  current = head
  runner = head
  stack = []

  while runner && runner.next != nil
    stack.unshift(current.id)
    current = current.next
    runner = runner.next.next
  end


  if runner != nil
    current = current.next
  end

  index = 0
  while current != nil
    return false if stack[index] != current.id
    current = current.next
    index += 1
  end

  true
  # This is the simplest best solution of all
end

node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(2)
node5 = Node.new(1)
# node6 = Node.new(1)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
# node5.next = node6
# node6.next = node7

# p node1
p palindrome?(node1)
