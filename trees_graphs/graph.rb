class Graph

end

class Node
  attr_accessor :adjacent, :visited

  def initialize(value)
    @value = value
    @visited = false
    @adjacent = []
  end

  def visit
    puts @value
  end
end


class SimpleGraph
  def self.create
    node0 = Node.new(0)
    node1 = Node.new(1)
    node2 = Node.new(2)
    node3 = Node.new(3)
    node4 = Node.new(4)
    node5 = Node.new(5)


    node0.adjacent = [node1, node4, node5]
    node1.adjacent = [node3, node4]
    node3.adjacent = [node2, node4]
    node2.adjacent = [node1]

    node0
  end
end
