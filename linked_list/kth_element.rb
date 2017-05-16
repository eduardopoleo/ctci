require_relative './linked_list'

# Find the kth element to last (going backwards)

$index = 0
def kth_element(head, k)
  # 2 cases: when the length is known/unknown
  # length is known
  # current = list.head
  # length = 1
  #
  # while current.next != nil
  #   current = current.next
  #   length += 1
  # end
  #
  # target_index = (length - k + 1)
  #
  # current = list.head
  # current_index = 1
  #
  # while current_index != target_index
  #   current = current.next
  #   current_index += 1
  # end
  #
  # current.id

  ### O(N^2) ###
  # this solution is not great since it requires us to know the length of the
  # list

  ###RECURSIVE 1 ####
  # Recursion has the concept of backtracking.

  # if head == nil
  #   return 0
  # end
  #
  # index = kth_element(head.next, k) + 1
  #
  # if index == k
  #   p "The value is #{head.id}"
  # end
  #
  # index

  # O(N) but alos O(N) in space as it needs to keep track of all the stack
  # drawback for this is that you can't return the node. Just the index as they
  # accumulate

  ###### RECURSIVE 2 #############
  # Using a wrapper (global index variable basically) to be able to return the next node
  # if head == nil
  #   return head
  # end
  #
  # node = kth_element(head.next, k)
  # $index += 1
  # # if I put index before the by the time the recursion stack
  # # starts backtracking the index is already 10 which defeats the purpose of the
  # # exercise
  #
  # if $index == k
  #   return head # all the returns all nil until this one goes through.
  #   # after that all of them are the response that we want.
  # end
  #
  # node # the last return is the one that counts.
  #### BEST Solution #####
  # The idea is to have 2 runners.

  runner = head
  current = head
  counter = 0

  while counter != k
    counter += 1
    runner = runner.next
  end


  while runner != nil
    current = current.next
    runner = runner.next
  end

  current
  # there is beauty in this... so simple yet so telling.
end

list = LinkedList.new(1)
list.append_to_tail(2)
list.append_to_tail(3)
list.append_to_tail(4)
list.append_to_tail(5)
list.append_to_tail(6)
list.append_to_tail(7)
list.append_to_tail(8) #=> 3
list.append_to_tail(9)
list.append_to_tail(10)

p kth_element(list.head, 3).id
