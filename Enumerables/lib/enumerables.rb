class Array
  def my_each(&prc)
    i = 0
    while i < length
       yield self[i]
       i += 1
    end
    return self
  end
end

return_value = [1,2,3].my_each do |num|
   puts num
end #=> 1,2,3

p return_value

class Array
    def my_select(&prc)
        result = []
        each do |ele|
            result << ele unless prc.call(ele) == false
        end
        return result
    end
    
end

a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []


class Array
    def my_reject(&prc)
        result = []
        each do |ele|
            result << ele unless prc.call(ele) == true
        end 
        return result
    end 
end 
a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]

class Array
   def my_any?(&prc)
       each do |ele|
          if prc.call(ele) == true
              return true
          end 
       end
       return false
   end
   
   def my_all?(&prc)
       each do |ele|
           if prc.call(ele) == false
               return false
           end 
       end 
       return true
   end 
end

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true

class Array
    def my_flatten(&prc)
        recursive_flatten(self)
    end 
    
    def recursive_flatten(array, results = [])
        array.each do |ele|
           if ele.class == Array
               recursive_flatten(ele, results)
           else
               results << ele
           end
        end
        return results
    end
end 

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

class Array
   def my_zip(a, b, *rest)
       arr = []
      i = 0
      while i < length
         array = []
         array  << self[i] unless nil
         array  << a[i] unless nil
         array  << b[i] unless nil
         rest.each do |c_d|
             array << c_d[i]
         end
         arr << array
      i += 1
      end
      return arr
   end
end

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


class Array
   def my_rotate(n=1)
       return self.drop(n%self.length) + self.take(n%self.length)
   end 
end

a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

class Array
    def my_join(char= "")
        arr = []
        i = 0
        while i < self.length - 1
           arr << self[i]
           arr << char
        i +=1
        end
        
        arr << self[length-1]
        return arr.join("")
    end 
end 


a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"

class Array
    def my_reverse
       arr = []
       i = self.length - 1
       while i >= 0
          arr << self[i]
       i -= 1
       end
       return arr
    end
end 

[ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
[ 1 ].my_reverse               #=> [1]

def factors(num)
  arr = []
  (1..num).each do |factor|
    if (num % factor == 0)
      arr << factor
    end 
  end
  return arr
end

class Array
def bubble_sort(&prc)
   self.dup.bubble_sort!(&prc)
  end
  
  def bubble_sort!(&prc)
    bool = true
    while bool
    bool = false
    (0..self.size-2).each do |i|
      if block_given?
        if prc.call(self[i], self[i+1]) == 1
          self[i], self[i+1] = self[i+1], self[i]
          bool = true
        end
      else # block not given
        if (self[i] > self[i+1])
          self[i], self[i+1] = self[i+1], self[i]
          bool = true
        end
      end  
    end
    end # end while
  return self
end # end bubble_sort!
end 
  
ascending = Proc.new { |num1, num2| num1 <=> num2 } #sort ascending
descending = Proc.new { |num1, num2| num2 <=> num1 } #sort descending

def substrings(string)
  substr = []
  string.chars
  length = string.length
  length.times do |start_pos|
    (0..(length+1-start_pos)).each do |len|
      #byebug
      substr << string[start_pos..len]
    end
  end 
  return substr.uniq
end

def subwords(word, dictionary)
  new_arr = []
  substr_arr = substrings(word)
  dictionary.each do |word|
    if substr_arr.include?(word) then new_arr << word end
  end
  return new_arr
end