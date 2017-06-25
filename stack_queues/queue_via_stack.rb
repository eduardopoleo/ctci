require_relative './stack'


class MyQueue
  attr_reader :newest, :oldest

  def initialize
    @newest = Stack.new
    @oldest= Stack.new
  end

  def add(node)
    newest.push(node)
  end

  def remove
    shift_stacks
    oldest.pop
  end

  def peek
    shift_stacks
    oldest.peek
  end

  private

  def shift_stacks
    if oldest.empty?
      while !newest.empty?
        el = newest.pop
        oldest.push(el)
      end
    end
  end
end

node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)
node5 = Node.new(5)

queue = MyQueue.new

queue.add(node1)
queue.add(node2)
queue.add(node3)
queue.add(node4)

node = queue.remove

p node

p queue.peek
