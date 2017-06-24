# The whole purpose is to have constant time (1) of insertion and pop
class ThreeInOne
  attr_reader :elements, :stack_size, :sizes

  def initialize(stack_size)
    @elements = Array.new(stack_size * 3)
    @stack_size = stack_size
    @sizes = [0,0,0]
  end

  def push(element, stack_number)
    raise 'The stack is full please try another!' if full?(stack_number)

    index = index(stack_number)
    @elements[index] = element

    @sizes[stack_number] += 1
  end

  def pop(stack_number)
    raise 'the stack is empty there is nothing to pop' if empty?(stack_number)

    pop_index = index(stack_number) - 1

    element = @elements[pop_index]
    @elements[pop_index] = nil
    sizes[stack_number] -= 1

    element
  end

  def peek(stack_number)
    if empty?(stack_number)
      puts 'the stack is empty there is nothing to peek'
      return
    end

    peek_index = index(stack_number) - 1
    element = @elements[peek_index]
  end

  private

  def index(stack_number)
    stack_size * stack_number + sizes[stack_number]
  end

  def full?(stack_number)
    sizes[stack_number] == stack_size
  end

  def empty?(stack_number)
    sizes[stack_number] == 0
  end
end


stacks = ThreeInOne.new(3)

stacks.push(4, 0)
stacks.push(3, 0)
stacks.push(5, 0)
stacks.push(7, 2)
stacks.push(6, 2)
p stacks.peek(2)
p stacks.pop(2)
