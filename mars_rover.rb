# Determines which direction robot is facing
def direction(lr, face)
  turn = {"L" => -1, "R" => 1}
  dir = ["N","E" ,"S" ,"W"]

  if lr == "L" && face == "N"
  	return "W"
  elsif lr == "R" && face == "W"
  	return "N"
  else
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
def user_command(command)
  return command.split('')
end

