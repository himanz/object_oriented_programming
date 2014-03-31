class Rover
  DIRECTIONS = %w(N E S W)
  attr_reader :x, :y
  
  def initialize(x, y, d)
  	@x = x
  	@y = y
  	@d = d
  end

	def move
		if @d == "N"
			@y += 1
		elsif @d == "E"
			@x += 1
		elsif @d == "S"
			@y -= 1
	  elsif @d == "W"
	  	@x -= 1
	  end
	end

	def turn_left
    @d = DIRECTIONS[(DIRECTIONS.index(@d) - 1) % 4]
	end

	def turn_right
		@d = DIRECTIONS[(DIRECTIONS.index(@d) + 1) % 4]
	end

	def final_location
		puts "#{@x} #{@y} #{@d}"
	end
end

class Commands
	X = 0
	Y = 1
	D = 2
	def start
		puts "Enter max X axis for grid"
		@xmax = gets.chomp.to_i
		puts "Enter max Y axis for grid"
		@ymax = gets.chomp.to_i
		puts "Enter coordinates and direction for rover to start like so: 1 2 N"
		coords = gets.chomp.split(" ")
		@commands = Rover.new(coords[X].to_i, coords[Y].to_i, coords[D])
	end

	def command
		puts "Enter Commands for the rover like so: LMLMLMLMM"
		user_command = gets.chomp.split("")
		user_command.each do |input|
			if input == "M"
				@commands.move
		 		if @commands.x < 0 || @commands.x > @xmax
	   	    puts "OUT OF BOUNDS"
	   	    return
	      elsif @commands.y < 0 || @commands.y > @ymax
	   	    puts "OUT OF BOUNDS"
	   	    return
	      end
	    elsif input == "L"
				@commands.turn_left
			elsif input == "R"
				@commands.turn_right
			else
				puts "#{input} is unknown command"
			end
		end
		@commands.final_location
	end
end

jon = Commands.new
jon.start
jon.command