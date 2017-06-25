class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class Stack
  attr_reader :max_size, :size, :top

  def initialize(node, max_size)
    @top = node
    @max_size = max_size
    @size = 1
  end

  def push(node)
    node.next = top
    @size += 1
    @top = node
  end

  def pop
    old_top = @top
    @top = @top.next
    @size -= 1
    old_top.next = nil
  end

  def full?
    size == max_size
  end

  def empty?
    size == 0
  end
end

class SetOfStacks
  attr_reader :stacks, :max_size, :current_index

  def initialize(stack, max_size)
    @stacks = [stack]
    @max_size = max_size
    @current_index = 0
  end

  def push(node)
    if current_stack.full?
      new_stack = Stack.new(node, max_size)
      @stacks << new_stack
      @current_index += 1
    else
      current_stack.push(node)
    end
  end

  def pop
    current_stack.pop

    if current_stack.empty? && current_index != 0
      @current_index -= 1
      @stacks.pop
    end
  end

  private

  def current_stack
    current_stack = stacks[current_index]
  end
end


node1 = Node.new(1)
stack1 = Stack.new(node1, 2)
set = SetOfStacks.new(stack1, 2)

node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)

set.push(node2)
set.push(node3)
set.push(node4)

set.pop
set.pop
set.pop

p set.stacks
