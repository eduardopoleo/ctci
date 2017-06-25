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

  def shift
    current = @top

    if current.next == nil
      return current
    end

    while true
      next_node = current.next

      if next_node.next == nil
        current.next = nil
        break
      end

      current = next_node
    end

    next_node
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

  def pop_at(index)
    if index == current_index
      self.pop
    else
      stacks[index].pop
      shift_left(index)
    end
  end

  private

  def current_stack
    current_stack = stacks[current_index]
  end

  def shift_left(index)
    current_stack = stacks[index]
    next_stack = stacks[index + 1]

    bottom_node = next_stack.shift
    current_stack.push(bottom_node)

    if index < @stacks.size - 2
      shift_left(index + 1)
    end
  end
end


node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)

node4 = Node.new(4)
node5 = Node.new(5)
node6 = Node.new(6)

node7 = Node.new(7)
node8 = Node.new(8)
node9 = Node.new(9)

stack1 = Stack.new(node1, 3)
set = SetOfStacks.new(stack1, 3)

set.push(node2)
set.push(node3)

set.push(node4)
set.push(node5)
set.push(node6)

set.push(node7)
set.push(node8)
set.push(node9)

set.pop_at(2)

p set.stacks[1]
p set.stacks[2]
