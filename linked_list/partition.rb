require_relative './linked_list'

def partition(list, k)
  # This is a 'stable' solution where we keep the order of the elements.
  # gotta keep track of 2 extra lists
  # small_list = LinkedList.new
  # big_list = LinkedList.new
  #
  # current = list.head
  #
  # while current != nil
  #   # I should not use dup. It's a costly operation.
  #   # The reason I was dupping is so that I can freely iterate over the
  #   # list. If sever the original list node I won't be able to go past
  #   # the first node
  #   # I get around this by keeping track of the next node so that I can
  #   # reference to it when reassiging current.
  #   next_node = current.next
  #   current.sever
  #
  #   if current.id < k
  #     small_list.append_to_tail(current)
  #     # gotta keep track which is the last element appended to the small list
  #     last_for_small = current
  #   else
  #     big_list.append_to_tail(current)
  #   end
  #
  #   current = next_node
  # end
  #
  # last_for_small.next = big_list.head
  # small_list

  ### O(N) #### Just a scan and then adds to the lists.
  ##  But has to keep track of 2 additional lists and the end of the small list

  head = list.head
  tail = list.head
  current = head

  while current != nil
    next_node = current.next

    if current.id < k
      current.next = head
      head = current
    else
      tail.next = current
      tail = current
    end

    current = next_node
  end

  tail.next = nil

  head

  # It is interesting how there is no need to really use the list class
  # having a reference to the head node it's usually good enough
end

list = LinkedList.new(3)
list.append_to_tail(5)
list.append_to_tail(8)
list.append_to_tail(1)
list.append_to_tail(10)
list.append_to_tail(2)
list.append_to_tail(1)

new_list = partition(list, 5)

p new_list
