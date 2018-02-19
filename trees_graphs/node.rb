class Node
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def visit
     puts @value
  end
end

# perfect binarty tree p.102
class SimpleTree
  def self.create
    root = Node.new(10)
    node5 = Node.new(5)
    node9 = Node.new(9)
    node18 = Node.new(18)
    node20 = Node.new(20)
    node3 = Node.new(3)
    node7 = Node.new(7)

    root.left = node5
    root.right = node20

    node5.left = node9
    node5.right = node18

    node20.left = node3
    node20.right = node7

    root
  end
end

class BinarySearchTree
  def self.create
    root = Node.new(8)
    node4 = Node.new(4)
    node2 = Node.new(2)
    node6 = Node.new(6)
    node10 = Node.new(10)
    node20 = Node.new(20)

    root.left = node4
    root.right = node10

    node4.left = node2
    node4.right = node6

    node10.right = node20

    root
  end
end
