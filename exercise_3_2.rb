class Price
end

class Manipulation
end	

class User
	def run
		@receipt = []
		@done = false
		while !@done
			user_input
		end
		print @receipt 
	end


	def user_input
		puts "Enter a sentence (type EXIT to finish)"
			input = gets.chomp
			if input == "EXIT"
				@done = true

			else
				@receipt << input
			end
	end
end

jon = User.new
jon.run