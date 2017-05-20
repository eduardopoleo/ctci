require_relative './linked_list'

def intersection(head1, head2)
  length1 = 0
  length2 = 0

  current1 = head1
  current2 = head2

  while current1 != nil || current2 != nil
    length1 += 1 unless current1.nil?
    length2 += 1 unless current2.nil?

    if current1 && current1.next == nil
      last_current1 = current1
    end

    if current2 && current2.next == nil
      last_current2 = current2
    end

    current1 = current1.next unless current1.nil?
    current2 = current2.next unless current2.nil?
  end

  if last_current1.object_id != last_current2.object_id
    return 'The list do not intersect'
  end

  current1 == head1
  current2 == head2

  if length1 == length2
    while current1 != nil
      if current1.object_id == current2.object_id
        return current1
      end

      current1 = current1.next
      current2 = current2.next
    end
  else
    longest_list = length1 > length2 ? head1 : head2
    shortest_list = length1 < length2 ? head1 : head2

    diff = (length1 - length2).abs
    current_long = longest_list

    while diff != 0
      current_long = current_long.next
      diff -= 1
    end

    current_short = shortest_list

    while current_short != nil
      if current_short.object_id == current_long.object_id
        return current_short
      end

      current_short = current_short.next
      current_long = current_long.next
    end
  end
end


node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)

node4 = Node.new(4)
node5 = Node.new(5)
node6 = Node.new(6)

node7 = Node.new(7)


node1.next = node2
node2.next = node3
node3.next = node7

node4.next = node5
node5.next = node6
node6.next = node2

head1 = node1
head2 = node4

p intersection(head1, head2)
