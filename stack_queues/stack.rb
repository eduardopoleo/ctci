# Seems to me that queues and stack do required the
# wrapper around the node
# Since are expected functionality of the data
# structure

class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

# FILO: First in, last out
# pop push, peeek, isEmpty?
class Stack
  # the top= only works from outside the instance inside I'm still required to
  # use it
  attr_accessor :top

  def initialize(top)
    @top = top
  end

  # pushes node to the top of the stack
  def push(node)
    if @top.nil?
      @top = node
    else
      node.next = top
      @top = node
    end
  end

  def pop
    raise 'The stack is empty' if empty?

    popped = top
    @top = top.next
    popped.next = nil
    popped.data
  end

  def empty?
    top.nil?
  end

  def peek
    top.data
  end
end

# node1 = Node.new(1)
# stack = Stack.new(node1)
# p stack.peek
# node2 = Node.new(2)
# stack.push(node2)
# p stack.peek
# p stack.pop
# p stack.peek
