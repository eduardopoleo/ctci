class Node
  attr_accessor :left, :right

  def initialize(value)
    @value = value
  end

  def visit
     puts @value
  end
end

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
