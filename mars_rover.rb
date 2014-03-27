# Determines which direction robot is facing
def direction(lr, face)
  turn = {"L" => -1, "R" => 1}
  dir = ["N","E" ,"S" ,"W"]

  # Checks to see if condition met to go past index
  if lr == "L" && face == "N"
  	return "W"
  elsif lr == "R" && face == "W"
  	return "N"
  else
  	# Navigate the dir array based on inputs
  	return dir[dir.index(face)+turn[lr]]
  end  
end

# Determines whether or not to add or subtract from the x and y coordinate
def moving(direction)
  value = { "N" => 1,
  	        "E" => 1,
  	        "S" => -1,
  	        "W" => -1
  }
	return value[direction]
end

# Split user commands into single letter commands
def command_split(command)
  return command.split('')
end

# Gets user commands
def user_command
	puts "Please enter commands on one line (example - LMLMLMLMM )"
	return gets.chomp
end

# Defines max grid from user input
def grid
	puts "Enter a max size for x co-ordinate"
	x = gets.chomp.to_i
	puts "Enter a max size for y co-ordinate"
	y = gets.chomp.to_i
  puts "Your grid is [#{x},#{y}]"
	return [x, y]
end

# Start point on grid from user input
def start
	puts "Enter starting x co-ordinate"
	x = gets.chomp.to_i
	puts "Enter starting y co-ordinate"
	y = gets.chomp.to_i
	puts "Enter which direction facing"
	dir = gets.chomp
	return [x, y, dir]
end

grid

x, y, face = start

command = user_command

indiv_command = command_split(command)

indiv_command.each do |action|
	if action == "L" or action == "R"
		face = direction(action, face)
	elsif action == "M"
		if face == "N" or face == "S"
			y += moving(face)
		elsif face == "E" or face == "W"
			x += moving(face)
		end
	end
end

print "result is #{x} #{y} #{face}\n"



