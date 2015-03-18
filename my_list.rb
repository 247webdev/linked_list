# Implement a Linked List

# DONE Need to create a representation of a Node (or Vertex).
# DONE Write a method add_to_tail that appends a new value to the end.
# DONE Write a method length that returns the length of a list.
# DONE Overide the to_s method to nicely print the list.
# DONE Bonus: Write a function remove to remove a node from the list.

# In ruby we don't have a way to use memory locations so to approximate it, we will use an array
# nodes will be hashes containing key value: which is the content and next: which is the pointer to next

class Node

  attr_reader :val
  attr_reader :next

  def initialize(val)
    @val = val
    @next = nil
    @head = self
  end

  def to_s
    if @next == nil
      @val 
    else
      "#{@val}#{@next}"
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
    if @next == nil
      1
    else
      1 + @next.length
    end
  end

  def remove(val)
    if self.val == val # I would like to be able to shift the nodes towards head by one
      unless @next.next == nil # check that the head is not also the tail
        # puts @head
        # puts "@next is: #{@next}"
        # puts "Self is #{self}" # I can get here.
        # puts "Self.next is #{self.next}" # self.next is the same as @next !!!
        # self = @next # not allowed to alter self
        @head = @next # Does the shift... now can I get it out?
        # puts @head
      end
      puts "Removed \"#{val}\" from the head, which is now: #{@head}" # this works but @head doesn't get out
    elsif @next.val == val
      # puts "Found #{val}\t|#{@next}"
      if @next.next == nil
        @next = nil # found val at the tail so make next = nil
      else
        @next = @next.next # found val within the linked list and the found node has a child
      end

    elsif @next.next == nil
      puts "\"#{val}\" not found."

    else
      # puts "Going to next\t|#{@next}"
      @next.remove(val) # recursivness aqui
    end

  end

end

head  = Node.new("D")
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
head.add_to_tail(".")

head.remove("D") # ALMOST WORK - tries to remove the head
# head.remove("Z") # WORKS - tries to remove letter not there
# head.remove("s") # WORKS - removes the first found s
# head.remove(".") # WORKS - removes the tail
# head.remove("f") # WORKS - removes the new tail if the previous remove "." was used
# puts "Final result: #{@head}" # no @head output @head is ""
puts "Final result: #{head}"