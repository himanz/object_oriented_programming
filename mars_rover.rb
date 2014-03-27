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

# movement - if direction is N or S then add/subtract from y coordinate
# movement - if direction is E or W then add/subtract from x coordinate

# Determines whether or not to add or subtract from the x and y coordinate
def moving(direction)
	if direction == "N"
		return 1
	elsif direction == "S"
		return -1
	elsif direction == "E"
		return 1
	elsif direction == "W"
		return -1
	else
		return "ERROR in moving"
	end
end

puts direction("L", "E")