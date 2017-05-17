require_relative './linked_list'

def partition(list, k)
  small_list = LinkedList.new(0)
  big_list = LinkedList.new(1000)

  current = list.head

  while current != nil
    isolated_node = current.dup
    isolated_node.sever

    if current.id < k
      small_list.append_to_tail(isolated_node)
      last_for_small = isolated_node
    else
      big_list.append_to_tail(isolated_node)
    end

    current = current.next
  end

  last_for_small.next = big_list.head
  small_list
end

list = LinkedList.new(3)
list.append_to_tail(5)
list.append_to_tail(8)
list.append_to_tail(1)
list.append_to_tail(10)
list.append_to_tail(2)
list.append_to_tail(1)

new_list = partition(list, 5)

new_list.to_s
