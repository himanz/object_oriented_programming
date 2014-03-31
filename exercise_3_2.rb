class Price
end

class User
	def run
		@receipt = []
		done = false
		while != done
			puts "Enter a sentence (type EXIT to finish)"
			input = gets.chomp
			if input == EXIT
				break
			else
				@receipt << input
			end
		end 
	end

	def user_input
	end
end

class Manipulation
end	