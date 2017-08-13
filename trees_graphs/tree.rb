class Node
  attr_reader :value, :children

  def initialize(value, children)
    @value = value
    @children = children # adjecency list
  end

  # Exclusively for binary trees
  def left
    children[0]
  end

  def right
    children[1]
  end
end
# Binary tree
#   every node has only 2 children
# Binary search tree,
#   value to the left is always smaller
# Complete Binary tree
#   All levels of the tree are complete meaning that have at least one children
#   to the left (one children to the right does not count cuz this will be cons
#   considered one extra level)
# Full Binary tree
#   Every node has zero or 2 children
# Perfect binary tree
#   Complete & Full binary Tree
