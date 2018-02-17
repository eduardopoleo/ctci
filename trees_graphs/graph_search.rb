require_relative './graph'

def dfs(root)
  return if nil == root
  # this seems to be some validation concern
  root.visited = true
  root.visit

  root.adjacent.each do |node|
    if !node.visited
      dfs(node)
    end
  end
end

puts '#################################'
puts '############# dfs ###############'
graph = SimpleGraph.create
dfs(graph.root)

# NOTES on dfs
# - want to visit every node of the graphs
# - cuz it's much simpler than bfs
# - recursive (in general).
# NOTE: Find out how is it implemented in AQL vistors?
# does do it recursively?

def bfs(root)
  # NOTE implement real queue for performance
  queue = []
  root.marked = true
  queue.push(root)

  while !queue.empty?
    node = queue.shift
    node.visit

    node.adjacent.each do |node|
      if node.marked == false
        node.marked = true
        queue.push(node)
      end
    end
  end
end

puts '#################################'
puts '############# bfs ###############'
graph = SimpleGraph.create
bfs(graph.root)

# NOTES on bfs
# - finds the shortest paths. Remember friends example
# - Non recursive
# - no concept of visted but marked meaning if it's been added to the
# queue previously

## Biderctional search
## shortes path between 2 known nodes is faster if we triggered searches from
## both nodes k^d vs k^d/2  where k is the number of adjacent nodes.
