class Node
  attr_accessor :data, :next
  def initialize(data)
    @data = data
    @next = nil
  end
end

# FIFO first in, first out
# peek, add, remove, empty?
class Queue
  attr_accessor :first, :last

  def initialize(node)
    @first = node
    @last = node
  end

  def peek
    empty_queue_error
    first.data
  end

  def empty?
    @first.nil?
  end

  def remove
    empty_queue_error
    item = first.data

    @first = first.next

    if @first.nil?
      @last = nil
    end

    item
  end

  def add(node)
    if first.nil?
      @first = node
      @last = node
    else
      @last.next = node
      @last = node
    end
  end

  private

  def empty_queue_error
    raise 'Queue is empty' if empty?
  end
end
#
# node1 = Node.new(1)
# queue = Queue.new(node1)
# p queue.peek
# node2 = Node.new(2)
# queue.add(node2)
# p queue.peek
# queue.remove
# p queue.peek
# queue.remove
# p queue.peek
