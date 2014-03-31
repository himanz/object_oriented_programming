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
		puts "Enter coordinates and direction like so: 1 2 N"
		coords = gets.chomp.split(" ")
		@commands = Rover.new(coords[X].to_i, coords[Y].to_i, coords[D]) 
	end

	def command
		puts "Enter Commands for the rover like so: LMLMLMLMM"
		user_command = gets.chomp.split("")
		@user_command.each do |input|
			if input == "M"
				@commands.move
			elsif input == "L"
				@commands.turn_left
			elsif input == "R"
				@commands.turn_right
			else
				puts "#{input} is unknown command"
			end
		end
	end
end

class Grid
end

jon = Commands.new
jon.start
jon.command