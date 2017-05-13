require_relative './linked_list'
require 'set'

list = LinkedList.new('A1')
list.append_to_tail('A2')
list.append_to_tail('A3')
list.append_to_tail('A4')

list.append_to_tail('A4')
list.append_to_tail('A5')
list.append_to_tail('A3')
list.append_to_tail('A7')
list.append_to_tail('A7')

def removing_dups(list)
  current = list.head
  ids = Set.new
  ids.add(current.id)

  while current && current.next != nil
    # There is a case where the current element id has not beed added to the set
    ids.add(current.id)
    id = current.next.id

    if ids.include?(id)
      current.next = current.next.next
    else
      ids.add(id)
    end

    current = current.next
  end
  list
end

removing_dups(list)

list.to_s
