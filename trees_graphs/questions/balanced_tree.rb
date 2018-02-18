require_relative '../node'

MIN = -10000

def balanced?(root)
  calculate_height(root) != MIN
end

def calculate_height(node)
  return -1 if node == nil

  height_left = calculate_height(node.left)
  # puts height_left
  return MIN if  height_left == MIN

  height_rigth = calculate_height(node.right)
  return MIN if  height_rigth == MIN

  height_diff = (height_left - height_rigth).abs

  if height_diff > 1
    return MIN
  else
    [height_left, height_rigth].max + 1
  end
end

puts '########## Balance tree #########'
root = SimpleTree.create
p balanced?(root)

class UnbalancedTree
  def self.create
    root = Node.new(10)
    node5 = Node.new(5)
    node9 = Node.new(9)
    node18 = Node.new(18)

    root.left = node5

    node5.left = node9
    node5.right = node18

    root
  end
end

puts '########## UnBalanced tree #########'
root = UnbalancedTree.create
p balanced?(root)
