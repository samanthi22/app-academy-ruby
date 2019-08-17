require_relative "Card.rb"
require_relative "Board.rb"

class Game
    
    attr_accessor :previous_guess, :board
    
    puts "Enter a size for the game: "
    @board = Board.new(gets.chomp.to_i)
    @board.populate
    @board.start_game
    
    def self.make_guess(guess_pos)
        if @previous_guess.nil?
            @board.reveal(guess_pos)
            @previous_guess = guess_pos
        else # second card
            if @board.reveal(guess_pos) == @board.reveal(@previous_guess)
                @board.reveal(guess_pos)
                @board.reveal(@previous_guess)
                @previous_guess = nil
            else
                @board[guess_pos].hide
                @board[@previous_guess].hide 
                @previous_guess = nil
            end 
        end 
    end

until @board.won? do
  @board.render
  p @board
  pos = @board.get_guess_pos
  self::make_guess(pos)
end
end