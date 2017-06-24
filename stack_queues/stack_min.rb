class Node
  attr_accessor :data, :next, :min

  def initialize(data)
    @data = data
    @next = nil
    @min = nil
  end
end

class MinStack
  attr_reader :top

  def initialize(node)
    @top = node
    @top.min = @top.data
  end

  def push(node)
    node.next = top

    if node.data <= @top.min
      node.min = node.data
    else
      node.min = @top.min
    end

    @top = node

    @top
  end

  def pop
    popped = @top
    @top = @top.next
    popped.next = nil

    popped
  end

  def min
    @top.min
  end
end


node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)
node5 = Node.new(5)
node6 = Node.new(-1)

stack = MinStack.new(node1)
stack.push(node2)
stack.push(node3)
stack.push(node4)
stack.push(node5)
stack.push(node6)
p stack.min
stack.pop
p stack.min
