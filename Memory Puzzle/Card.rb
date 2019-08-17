class Card
   attr_accessor :face_down, :face_value, :face_up
    
   def initialize(face_value)
       @face_value = face_value
       @face_down = true
       @face_up = false
   end 
   
   def face_value=(value)
      @face_value = value 
   end
   
   def display
      if @face_down
          return ""
      else
          return @face_value
      end 
   end
   
   def hide
       @face_down = true
       @face_up = false
   end
   
   def reveal
       @face_down = false
       @face_up = true
       return self.face_value
   end 
   
   def show
      @face_up = true
      @face_down = false
      return self.face_value
   end 
   
   def to_s
       return @face_value.to_s
   end 
   
   def ==(card)
      return self.face_value.to_s ==  card.face_value.to_s
   end 
end