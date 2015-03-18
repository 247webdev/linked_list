# list.rb

# Implement a Linked List
############
# DONE Need to create a representation of a Node (or Vertex).
# DONE Write a method add_to_tail that appends a new value to the end.
# DONE Write a method length that returns the length of a list.
# DONE Overide the to_s method to nicely print the list.
# Bonus: Write a function remove to remove a node from the list.


# in ruby we don't have a way to use memory locations so to approximate it, we will use an array
# nodes will be hashes containing key value: which is the content and next: which is the pointer to next

# letter_o = {
#   val: "o",
#   next: nil
# }

# letter_d = {
#   val: "d",
#   next: letter_o
# }

class Node

  def initialize(val)
    @val = val
    @next = nil
  end

  def to_s
    if @next == nil
      @val 
    else
      "#{@val} #{@next}"
    end
  end

  def add_to_tail(val)
    if @next == nil
      @next = Node.new(val)
    else
      @next.add_to_tail(val)
    end
  end

  def length
    counter = 1
    if @next == nil
      return counter
    else
      counter += @next.counter
    end
    counter
  end

  def remove(val)
    if head.val = val
  end

end

head  = Node.new("d")
head.add_to_tail("o")
head.add_to_tail("g")
head.add_to_tail(" ")
head.add_to_tail("s")
head.add_to_tail("a")
head.add_to_tail("y")
head.add_to_tail("s")
head.add_to_tail(" ")
head.add_to_tail("w")
head.add_to_tail("o")
head.add_to_tail("o")
head.add_to_tail("f")
head.add_to_tail("!")


puts head
puts head.length