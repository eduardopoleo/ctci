require_relative './queue.rb'
require_relative './stack.rb'

# Solution array of arrays, that defeats the purpose
# Having a marker in the array that delimits when one stack starts
# and when the other begins

class ThreeInOne
  attr_reader :stacks
  STACKS_NAMES = [:first, :second, :third]

  def initialize
    @stacks = [:first, :second, :third]
    # This is weird you can actually change the value of constants without warning
    # @stacks = STACKS_NAMES
  end

  def push(node, stack)
    l = stacks.length
    push_index = 0

    for i in 0...l
      if stacks[i] == stack
        push_index = i
        break
      end
    end

    @stacks.insert(push_index, node)
  end

  def pop(stack)
    l = stacks.length
    stack_index = 0

    for i in 0...l
      if stacks[i] == stack
        stack_index = i
        break
      end
    end

    pop_index = stack_index - 1

    if STACKS_NAMES.include?(stacks[pop_index])
      raise "#{stack} is empty. Nothigh to pop"
    end

    @stacks.delete_at(pop_index)
  end
end

three_in_one = ThreeInOne.new

node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)

three_in_one.push(node1, :first)
three_in_one.push(node2, :second)
three_in_one.push(node3, :third)

p three_in_one.stacks
three_in_one.pop(:second)

p three_in_one.stacks

three_in_one.pop(:second)
