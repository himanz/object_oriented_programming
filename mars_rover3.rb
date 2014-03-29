class Rover
  DIRECTION = %w(N E S W)
  NORTH = 0
  EAST = 1
  SOUTH = 2
  WEST = 3
  
  def initialize(x, y, direction, gridx, gridy)
  	@x = x
  	@y = y
  	@direction = direction
  	@gridx = gridx
  	@gridy = gridy
  end

	def turn_left
    if @direction == "N"
    	@direction = "W"
    elsif @direction == "E"
    	@direction = "N"
    elsif @direction == "S"
    	@direction = "E"
    elsif @direction == "W"
    	@direction = "S"
    end
	end

	def turn_right
		if @direction == "N"
			@direction = "E"
		elsif @direction == "E"
			@direction = "S"
		elsif @direction == "S"
			@direction = "W"
		elsif @direction == "W"
			@direction = "N"
		end
	end

	def move
		flag = false
    if @direction == "N"
    	@y += 1
    elsif @direction == "E"
    	@x += 1
    elsif @direction == "S"
    	@y -= 1
    elsif @direction == "W"
    	@x -=1
    end

    if @y <0 || @y > @gridy
    	flag = true
    elsif @x < 0 || @x > @gridx
    	flag = true
    end

    return flag

	end

	def to_s
		"#{@x} #{@y} #{@direction}"
	end
end

class Commander
	X = 0
	Y = 1
	DIRECTION = 2
  GRIDX = 3
  GRIDY = 4
	def starting_point(input)
		coords = input.split(" ")
		@rover = Rover.new(coords[X].to_i, coords[Y].to_i, coords[DIRECTION], coords[GRIDX].to_i, coords[GRIDY].to_i)
	end

	def commands(input)
		flag = false
		letter = input.split("")
		letter.each do |command|
			if command == "L"
				@rover.turn_left
			elsif command == "R"
				@rover.turn_right
			elsif command == "M"
				flag = @rover.move
				if flag == true 
					game_over
					break
				end
			end

		end
	end

  def game_over
  	puts "OUT OF BOUNDS"
  end

	def final
		puts @rover.to_s
	end
end

command = Commander.new
command.starting_point("1 2 N 5 5")
command.commands("LMLMLMLMM")
command.final

command2 = Commander.new
command2.starting_point("3 3 E 5 5")
command2.commands("MMRMMRMRRM")
command2.final