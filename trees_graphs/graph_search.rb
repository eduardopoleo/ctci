require_relative './graph'

def dfs(root)
  return if nil == root
  root.visited = true
  root.visit

  root.adjacent.each do |node|
    if !node.visited
      dfs(node)
    end
  end
end

root = SimpleGraph.create

dfs(root)
