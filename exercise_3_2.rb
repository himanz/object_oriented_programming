class Price
end

class Manipulation
end	

class User
	def run
		@receipt = []
		done = false
		while !done
			puts "Enter a sentence (type EXIT to finish)"
			input = gets.chomp
			if input == "EXIT"
				done = true
			else
				@receipt << input
			end
		end
		print @receipt 
	end


	def user_input
	end
end

jon = User.new
jon.run