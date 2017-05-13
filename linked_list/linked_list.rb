class Node
  attr_reader :id, :next

  def initialize(id)
    @id = id
    @next = nil
  end

  def append(node)
    @next = node
  end
end

class LinkedList
  attr_accessor :head

  def initialize(id)
    @head = Node.new(id)
  end

  def append_to_tail(id)
    last = Node.new(id)
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
