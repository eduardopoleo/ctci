# A linkedlist is simpler than stacks an queue
# this class will just do it
# The main purpose of the data structure is to transverse it.
class Node
  attr_accessor :id, :next

  def initialize(id)
    @id = id
    @next = nil
  end
  # it's more convinient to just use the accesor next
  def append(node)
    @next = node
  end

  def sever
    @next = nil
  end
end

# Basically the list it's just a wrapper around the head
# that provides convinient methods.
# - remove nodes
# - append
# - Maybe calculates the length of the lis
# - Prints the list etc
class LinkedList
  attr_accessor :head

  # This should be initialize always as nil not with a node but whatever
  def initialize(id=nil)
    @head = id ? Node.new(id) : nil
  end

  # All this should be simplied.
    # - Should only take nodes (maybe? it's pretty nice not having to initialize
    # nodes all the time.
    # - List should be initialize as nil all the time.
  # Unfortunately my provious exercises contain a different

  def append_to_tail(id_or_node)
    if !@head
      @head = id_or_node.is_a?(Fixnum) ? Node.new(id_or_node) : id_or_node
      return
    end

    last = id_or_node.is_a?(Fixnum) ? Node.new(id_or_node) : id_or_node
    current = @head

    while current.next != nil
      current = current.next
    end

    current.append(last)
  end

  def remove(id)
    if @head.id == id
      @head = @head.next

      return
    end

    current = @head

    while current.next != nil
      if current.next.id == id
        current.append(current.next.next)
        return
      end

      current = current.next
    end
  end

  def to_s
    current = @head

    s = "These are all the nodes: #{current.id}"

    while current.next != nil
      current = current.next
      s << " #{current.id}"
    end

    p s
  end
end

# list = LinkedList.new(1)
# list.append_to_tail(2)
# list.append_to_tail(3)
# list.append_to_tail(4)
# # list.remove(3)
#
# list.to_s
