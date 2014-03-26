def direction(lr, face)
	if face == "N"
		if lr == "L"
			return "W"
		elsif lr == "R"
			return "E"
		else
			return "LR ERROR, DONT KNOW INPUT"
		end
	elsif face == "E"
		if lr == "L"
			return "N"
		elsif lr == "R"
			return "S"
		else
			return "LR ERROR, DONT KNOW INPUT"
		end
	elsif face == "S"
		if lr == "L"
			return "E"
		elsif lr == "R"
			return "W"
		else
			return "LR ERROR, DONT KNOW INPUT"
		end
	elsif face == "W"
		if lr == "L"
			return "N"
		elsif lr == "R"
			return "S"
		else
			return "LR ERROR, DONT KNOW INPUT"
		end
	else
		return "ERROR DONT KNOW YOUR INPUT"
	end
end

# movement - if direction is N or S then add/subtract from y coordinate
# movement - if direction is E or W then add/subtract from x coordinate

puts direction("R", "N")