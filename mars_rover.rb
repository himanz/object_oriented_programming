 	class Robot
	def initialize(x, y, face, command, max_x, max_y)
		@x, @y, @face, @command, @max_x, @max_y = x, y, face, command, max_x, max_y
		$out_of_bounds = false
	end
  
  # Split the input command to 1 commands each
  def command_split
    return @command.split('')
  end
  
  # Determine which direction to face
  def direction(lr)
	  turn = {"L" => -1, "R" => 1}
	  dir = ["N","E" ,"S" ,"W"]

	  # Checks to see if condition met to go past index
	  if lr == "L" && @face == "N"
	  	return "W"
	  elsif lr == "R" && @face == "W"
	  	return "N"
	  else
	  	# Navigate the dir array based on inputs
	  	return dir[dir.index(@face)+turn[lr]]
	  end  
	end
  
  # Determine if moving is in a positive direction or negative
  def moving(direction)
	  value = { "N" => 1,
	  	        "E" => 1,
	  	        "S" => -1,
	  	        "W" => -1
	  }
		return value[direction]
	end
  
  # Rover moving logic
  def navigating
  	indiv_command = command_split

		indiv_command.each do |action|
			# Logic to determine out of bounds
      if @x < 0 || @y < 0 || @x > @max_x || @y > @max_y
        $out_of_bounds = true
        break        
      end 

			if action == "L" or action == "R"
				@face = direction(action)
			elsif action == "M"
				# Determine whether or not x or y axis is affected
				if @face == "N" or @face == "S"
					@y += moving(@face)
				elsif @face == "E" or @face == "W"
					@x += moving(@face)
				end
			end
		end
  end
  
  # Return x, y and direction values
  def result
  	return "#{@x} #{@y} #{@face}"
  end

  # Rover is going
  def go_time
  	self.navigating
  	if $out_of_bounds == false
		  print self.result
		else
			puts "OUT OF GRID BOUNDARIES, FAILBOT"
		end
    puts "\n"
    puts "----------------------------"
    puts "\n"
  end
end

# Max grid size
def grid(x, y)
	return x, y
end

# Checks if rover goes out of bounds
$out_of_bounds = false

grid_size_x, grid_size_y = grid(5, 5)

# Rover 1
doug = Robot.new(1, 2, "N", "LMLMLMLMM", grid_size_x, grid_size_y)
doug.go_time

# Rover 2
amy = Robot.new(3, 3, "E", "MMRMMRMRRM", grid_size_x, grid_size_y)
amy.go_time