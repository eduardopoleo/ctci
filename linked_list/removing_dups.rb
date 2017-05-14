require_relative './linked_list'
require 'set'

list = LinkedList.new('A1')
list.append_to_tail('A2')
list.append_to_tail('A3')
list.append_to_tail('A4')

list.append_to_tail('A5')
list.append_to_tail('A5')
list.append_to_tail('A3')
list.append_to_tail('A6')
list.append_to_tail('A6')
list.append_to_tail('A7')

def removing_dups(list)
  # ##### Allowing for set (buffer) of elements ####
  # ## O(N) ###
  # current = list.head
  # ids = Set.new
  # ids.add(current.id)
  #
  # while current && current.next != nil
  #   # There is a case where the current element id has not beed added to the set
  #   # Basically when the previous element has been removed then the current element
  #   # never went through the 'veting' process in this loop.
  #   ids.add(current.id)
  #   id = current.next.id
  #
  #   if ids.include?(id)
  #     current.next = current.next.next
  #   else
  #     ids.add(id)
  #   end
  #
  #   current = current.next
  # end
  # list
  #
  # ### Not allowing for a buffer ###
  # THis is exactly same solution as the book Yeii!!
  current = list.head

  while current.next != nil
    id = current.id
    # why does it work without dupping?
    runner = current

    while runner.next != nil
      if runner.next.id == id
        # It's ok to work on the same list items because I want to modify the
        # list in place. No need for dupping.
        runner.next = runner.next.next
        next
      end

      runner = runner.next
    end

    current = current.next
  end

  #### O(N^2)####
  ##### O(1) #### in space
end

removing_dups(list)

list.to_s
