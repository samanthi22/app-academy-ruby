require_relative "Card.rb"

class Board
   attr_accessor :grid, :guessed_pos
   attr_reader :size
   
   def initialize(size)
       @grid = Array.new(size) { Array.new(size, Card.new("X")) }
       @size = size
   end 
   
   
   def [](position)
      row, col = position
      @grid[row][col]
   end
   
   def []=(position, value)
      row, col = position
      @grid[row][col] = Card.new(value)
   end


    def populate
       length = @size + @size
        arr = []
        @size.times do |i|
        string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        value = string[rand(0..string.length-1)] # "I"
        arr << value
        arr << value
        end 
        arr.shuffle!
        
        (0..@size-1).each do |i|
            (0..@size-1).each do |j|
            pos = [i,j]
            self[pos] = arr[i]
            end
        end
        return @grid
    end
    
    def render
       puts "Current Board:"
       puts
       @grid.each do |row|
           puts value_izer(row).join("|")
       end 
       puts 
    end 
    
    def value_izer(row)
        arr = []
        row.each do |card|
        if card.face_up
            arr << card.face_value
        else
            arr << "_"
        end
        end 
        return arr
    end 
    
    def won?
        @grid.each do |row|
           row.each do |card|
               if !card.face_up
                   return false
               end 
           end 
        end
        puts "You've won!"
        return true
    end 
    
    def reveal(guessed_pos)
        self[guessed_pos].face_up = true unless self[guessed_pos].face_up == true
        return self[guessed_pos].face_value
    end 
    
    def get_guess_pos
       puts "enter a position to reveal a card like `4 7`" 
       input = gets.chomp
       ints = input.split(" ")
       @guessed_pos = ints.map { |num| num.to_i }
       return @guessed_pos
    end
    
    def start_game
       self.populate
       self.render
    end
   
end
