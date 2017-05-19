require_relative './linked_list'

def sum_list(head1, head2)
  # current = head1
  # number1 = 0
  # multiple = 1
  #
  # while current != nil
  #   number1 += current.id * multiple
  #   multiple *= 10
  #   current = current.next
  # end
  #
  # current = head2
  # number2 = 0
  # multiple = 1
  #
  # while current != nil
  #   number2 += current.id * multiple
  #   multiple *= 10
  #   current = current.next
  # end
  #
  # number = number1 + number2
  # previous = nil
  #
  # number.to_s.each_char do |c|
  #   node = Node.new(c.to_i)
  #   if !previous
  #     previous = node
  #     next
  #   end
  #
  #   node.next = previous
  #   previous = node
  # end

  # previous

  ## O(n1 + n2)
  ## is it possible to calculate this in one go.

  current1 = head1
  current2 = head2
  number1 = 0
  number2 = 0

  previous = nil
  head = nil
  extra = 0
  sum = 0

  loop do
    id1 = current1 ? current1.id : 0
    id2 = current2 ? current2.id : 0

    sum = id1 + id2 + extra
    node_id = sum % 10
    extra = sum / 10

    node = Node.new(node_id)

    if previous
      previous.next = node
      previous = node
    else
      previous = node
      head = node
    end

    sum = 0

    current1 = current1 ? current1.next : nil
    current2 = current2 ? current2.next : nil

    break if current1.nil? && current2.nil?
  end

  head

  # this is a superior solution
  # O(N of largest)
  # Do not rely on transformations
end

node1 = Node.new(4)
node2 = Node.new(3)
node3 = Node.new(2)
node4 = Node.new(1)

node1.next = node2
node2.next = node3
node3.next = node4

node5 = Node.new(3)
node6 = Node.new(2)
node7 = Node.new(1)

node5.next = node6
node6.next = node7

p sum_list(node1, node5)
