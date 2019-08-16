class Image
  def initialize(input)
    @pixels = input
    @locations = Array.new
  end

   def blur(distance)

    distance.times do 
    @pixels.each_with_index do |array, index_y|
      
      array.each_with_index do |number, index_x|
        
       if number == 1 
        @locations << [index_x, index_y]
       end      

      end
    end
    
      @locations.each do |coord|
        index_x = coord[0]
        index_y = coord[1]

         @pixels[index_y][index_x + 1] = 1 if index_x != @pixels[index_y].length - 1
         @pixels[index_y][index_x - 1] = 1 if index_x != 0
         @pixels[index_y + 1][index_x] = 1 if index_y != @pixels.length - 1
         @pixels[index_y - 1][index_x] = 1 if index_y != 0
      end
  end
end
    


  def output_image
    @pixels.each do |x|
      x.each do |y|
        print y
        print " "
      end
      puts "\n"
      puts "\n"
    end
  end
end

image = Image.new([
  [1,0,0,0],
  [0,0,0,0],
  [0,0,0,0],
  [0,0,0,0],
  [0,0,0,0],
  [0,0,0,0],
])

image.blur(3)
image.output_image
