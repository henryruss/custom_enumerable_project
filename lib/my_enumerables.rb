module Enumerable
  # Your code goes here
  def my_all?
    return true unless block_given?
    self.my_each do |el|
      return false unless yield(el)
    end
    true
  end


def my_any?
  return false unless block_given?
  self.my_each do |el|
    return true if yield(el)
  end
  false
end

def my_count
  return self.size unless block_given?

  count = 0
  self.my_each do |el|
    count +=1 if yield(el)
  end
  count
end


def my_each_with_index
  original = self
  count = 0
  self.my_each do |el|
    yield(el,count)
    count +=1
  end
  return original
end

def my_inject(num)
  self.my_each do |el| 
    num = yield(num, el)
  end
  num
end

def my_map
  new_arr = self
  self.my_each_with_index do |el,index|
    new_arr[index] = yield(el)
  end
  new_arr
end

def my_none?
  true unless block_given?

  self.my_each do |el|
    return false if yield(el)
  end
  true
end

def my_select
  arr = []
  self.my_each do |el|
    arr.push(el) if yield(el)
  end
  arr
end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for el in self
      yield(el) if block_given?
    end
  end
end

a = [1,3,5,3,3]
print a.my_none? { |value| value > 0 }
