require_relative '../graph'

def connected?(start, finish)
  return true if start == finish
  queue = []
  start.marked = true
  queue.push(start)

  while !queue.empty?
    node = queue.shift
    node.visit

    node.adjacent.each do |node|
      return true if node == finish

      if !node.marked
        node.marked = true
        queue.push(node)
      end
    end
  end

  return false
end

### Path from 0 to 3 ###
graph = SimpleGraph.create

start = graph.root
finish = graph.node3

puts connected?(start, finish)

## NOT path from 4 to 2
graph = SimpleGraph.create

start = graph.node4
finish = graph.node2

puts connected?(start, finish)
