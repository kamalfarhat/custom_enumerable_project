module Enumerable
  # Your code goes here
  def my_each
    if block_given?
      for elem in self
        yield elem
      end
    end
  end
  
  def my_each_with_index
    iterator = 0
    if block_given?
      for el in self
        yield el, iterator
        iterator += 1
      end
    end
  end

def my_select
  if block_given?
    result = []
    self.my_each {|elem| result.push(elem) if yield elem}
    result
  end
end

def my_all?
  if block_given?
    i = 0
    self.my_each {|elem| i += 1 if yield elem}
    return true if i == self.length
    return false unless i == self.length   
  end 
end

def my_none?
  if block_given?
    i = 0
    self.my_each {|elem| i += 1 if yield elem}
    return true if i == 0
    return false unless i == 0    
  end
end

def my_count
  if block_given?
    i = 0
    self.my_each {|elem| i += 1 if yield elem}
    return i
  else
    return self.size
  end
end

def my_map
  if block_given?
    result = []
    self.my_each {|elem| result.push(yield elem)}
    return result
  end
end

def my_inject(initial_value)
  if block_given?
    accumulator = initial_value
    self.my_each {|elem| accumulator = yield accumulator, elem}
    return accumulator
  end
end


end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  
end
