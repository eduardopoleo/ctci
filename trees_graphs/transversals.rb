# in-order transversal
require_relative './node'

root = SimpleTree.create
def in_order(node)
  if nil != node
    in_order(node.left)
    node.visit
    in_order(node.right)
  end
end
puts '########IN ORDER######'
in_order(root)

def pre_order(node)
  if nil != node
    node.visit
    pre_order(node.left)
    pre_order(node.right)
  end
end
puts '###########PRE ORDER #######'
pre_order(root)


def post_order(node)
  if nil != node
    post_order(node.left)
    post_order(node.right)
    node.visit
  end
end
puts '###########POST ORDER #######'
post_order(root)
