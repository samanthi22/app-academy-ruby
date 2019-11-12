

def range(num1, num2)
    num = num2-1
    if num1 == num
        return [num1]
    else
        #return [range(num1, num2-1), num].flatten
        return range(num1, num2-1) << num
    end
end

=begin
def range(num1, num2)
    arr = []
   (num1...num2).each do |num|
       arr << num
   end 
   return arr
end
=end


def sum(arr)
    if arr.length == 0 
        return 0
    else
    return arr[0] + sum(arr[1..-1])
    end
end 

=begin
def sum(arr)
   sum = 0
   i = 0
   while i < arr.length
     sum += arr[i]
     i += 1
   end 
   return sum
end
=end

p range(1,5) # => [1,2,3,4]
p sum([1,2,3,4,5]) # => 15

def exp(b, n)
   if n == 1
       return b*1
   elsif n == 0
       return 1
   else
       return b * exp(b, n-1)
   end
end



p exp(3, 0) #=> 1
p exp(3, 2) #=> 9
p exp(2, 3) #=> 8


def exp2(b, n) 
    if n == 0
        return 1
    elsif n == 1
        return b 
    elsif (n % 2 == 0)
        return exp2(b, n / 2) ** 2
    else 
        return b * (exp2(b, (n-1)/2) **2)
    end
end



p exp2(3, 0) #=> 1
p exp2(3, 2) #=> 9
p exp2(2, 3) #=> 8

class Array
    
    def deep_dup(&prc)
       return my_deep_dup(self) 
    end
    
    def my_deep_dup(array)
        array.each do |ele|
           if ele.is_a?Array
               my_deep_dup(array[1..-1])
           else
               array
           end 
        end
        return array
    end 
    
end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

robot_parts_copy = robot_parts.deep_dup

robot_parts_copy[1] << "LEDs"

p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]

p [1,[2],[3,[4]]].deep_dup #=> [1,[2],[3,[4]]]
array = [1] << [2]
p array << [3,[4]]

array = [1,[2],[3,[4]]]
array_copy = array.deep_dup
array[1] << 9
p array

=begin
def fibonacci(n)
    return [] if n == 0
    return [0] if n == 1
    return [0,1] if n == 2
    seq = fibonacci(n-1)
    seq << seq[-2] + seq[-1]
    return seq
end
=end

def fibonacci(n)
    seq = []
    i = 0
    while i < n
        if i < 2
            seq << i 
        else
            seq << seq[-2] + seq[-1]
        end
        i += 1
    end
    return seq
end 


p "Fibonacci"
p fibonacci(2) # => [0,1]
p fibonacci(5) # => [0,1,1,2,3]
p fibonacci(9) # => [0,1,1,2,3,5,8,13,21]

def bsearch(array, target) 
    return nil if array.empty?
    first = 0
    last = array.length - 1
        
    mid = (first + last) / 2
        if target > array[mid]
            result2 = bsearch(array[mid+1..-1], target)
            return result2.nil? ? nil : mid + 1 + result2
        elsif target < array[mid]
            result = bsearch(array[0...mid], target)
            return result.nil? ? nil : 0 + result
        else # equal
            return mid
        end
end 



p "Binary Search"
p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
    return array if array.size <= 1
    mid = array.size / 2
    left = array[0...mid]
    right = array[mid...array.size]
    merge(merge_sort(left), merge_sort(right))
end 

# call-stacks of one element arrays

def merge(left, right) 
   sorted = []
   until left.empty? || right.empty?
   if left.first <= right.first
       sorted << left.shift
   else
       sorted << right.shift
   end 
   end 
   sorted.concat(left).concat(right)
end 

p "Merge Sort"
p merge_sort([1,3,2]) # => [1,2,3]
p merge_sort([1, 3, 4, 2, 5, 7]) # => [1, 2, 3, 4, 5, 7]
p merge([1,3,4], [2, 5, 7])
p merge_sort([38, 27, 43, 3, 9, 82, 10])
p merge([38, 27, 43],[3,9,82])

def subsets(array)
    return [[]] if array == []
    old = subsets(array[0...-1])
    old + old.map {|sub| sub + [array.last]}
end

p "Subsets"
p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]


def permutations(array)
    new_arr = []
    if array.length == 1
        return "s"
    else
       old = permutations(array[1..-1])
       return "t"
    end
end

p "use slice [0...element] then [element + 1..-1]"
p "use permutations(array[1..-1])"

p "permutations"
p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]
p permutations([1,2]) # => [[1,2],[2,1]]
#p each_array([1,2])
#p each_array([1,2,3])
#p permutations([1]) #=> [1]

