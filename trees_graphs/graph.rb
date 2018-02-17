class Graph

end

class Node
  attr_accessor :adjacent, :visited, :marked

  def initialize(value)
    @value = value
    @visited = false # dfs
    @marked = false # bfs
    @adjacent = []
  end

  def visit
    puts @value
  end
end

class SimpleGraph
  attr_reader :root, :node1, :node2, :node3, :node4, :node5

  def self.create
    new.create
  end

  def initialize
    @root = Node.new(0)
    @node1 = Node.new(1)
    @node2 = Node.new(2)
    @node3 = Node.new(3)
    @node4 = Node.new(4)
    @node5 = Node.new(5)
  end

  def create
    root.adjacent = [node1, node4, node5]
    node1.adjacent = [node3, node4]
    node3.adjacent = [node2, node4]
    node2.adjacent = [node1]

    self
  end
end
