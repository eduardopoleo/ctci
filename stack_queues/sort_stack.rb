require_relative './stack'

node1 = Node.new(3)
node2 = Node.new(1)
node3 = Node.new(9)
node4 = Node.new(8)

stack = Stack.new

stack.push(node1)
stack.push(node2)
stack.push(node3)
stack.push(node4)

temp_stack = Stack.new


while !stack.empty?
  current_element = stack.pop

  if temp_stack.empty? || current_element.data <= temp_stack.top.data
    temp_stack.push(current_element)
    next
  end
end
