class Rover
  def initialize(x, y, d)
  	@x = x
  	@y = y
  	@d = d
  end

	def move
	end

	def direction
	end

	def turn_left
	end

	def turn_right
	end
end

class Commands
	X = 0
	Y = 1
	D = 2
	def start
		puts "Enter coordinates and direction like so: 1 3 N"
		coords = gets.chomp.split(" ")
		@commands = Rover.new(coords[X].to_i, coords[Y].to_i, coords[D]) 
	end
end

class Grid
end

jon = Commands.new
jon.start