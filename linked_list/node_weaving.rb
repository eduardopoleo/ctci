require_relative './linked_list'

# This is a better api, So that we do not want to deal with the
# node implementation

list = LinkedList.new('A1')
list.append_to_tail('A2')
list.append_to_tail('A3')
list.append_to_tail('A4')
list.append_to_tail('A5')

list.append_to_tail('B1')
list.append_to_tail('B2')
list.append_to_tail('B3')
list.append_to_tail('B4')
list.append_to_tail('B5')
# list.append_to_tail('B6')

def weaving(list)
  slow_head = list.head
  fast_head = list.head.next

  while fast_head.next != nil
    slow_head = slow_head.next
    fast_head = fast_head.next.next
  end

  fast_head = list.head

  while slow_head.next != nil
    slow_head = slow_head.next
    old_next = fast_head.next
    # We need to dup here otherwise new_next and slow_head will point to the
    # same memory adress. doing new_next.append(old_next) will cause
    # slow_head.append(old_next) as well which is weird
    new_next = slow_head.dup

    fast_head.append(new_next)
    new_next.append(old_next) unless slow_head.next == nil

    fast_head = old_next
  end

  list
end

list = weaving(list)

list.to_s









# list.to_s
