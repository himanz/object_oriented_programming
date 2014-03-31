class Price
	def unit_tax
	end

	def price_unit_with_tax
	end

	def total_price
	end

	def total_tax
  end

  def total_price_with_tax
  end
end

class Manipulation
	def split_sentence(sentence)
		@splitted = sentence.split(" ")
	end

	def remove_at(sentence)
		return sentence.delete_if {|x| x == "at"}
	end

	def join_sentence
	end

	def display_formatted_sentence
	end

	def get_price
	end
end	

class User
	def run
		@manip = Manipulation.new
		@receipt = []
		@done = false
		@word = ""
		while !@done
			user_input
		end
		@receipt.each do |item|
      @word = split_the_sentence(item)
      @word = remove_at(@word)
      print @word
		end
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

	def split_the_sentence(sentence)    
    @manip.split_sentence(sentence)
	end

	def remove_at(sentence)
		@manip.remove_at(sentence)
	end
end

jon = User.new
jon.run