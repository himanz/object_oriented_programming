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
		splitted = sentence.split(" ")
		return splitted
	end

	def remove_at(sentence)
		return sentence.delete_if {|x| x == "at"}
	end

	def join_sentence
	end

	def display_formatted_sentence
	end

	def get_price(sentence)
		return sentence.pop
	end
end	

class ListReceipt
  def initialize
  	@sentence_array = []
  	#@manip = Manipulation.new
  end
	
	def add_new(input)
		@sentence_array << input
	end
  
  def sentence_array
  	@sentence_array
  end

  def split_array(input)
    @split = input
  end

  def without_at_array(input)
  	@without_at = input
  end

  def return_split_array
  	return @split
  end

  def return_without_at
  	return @without_at
  end

  def price(input)
  	@price = input.to_f
  end

  def return_price
  	return @price
  end
end

class User
	def run
		@listreceipt = ListReceipt.new
		@manip = Manipulation.new
		#@receipt = []
		@done = false
		#@word = ""
		while !@done
			user_input
		end
		@listreceipt.sentence_array.each do |item|
			# split the array into single words
			@listreceipt.split_array(@manip.split_sentence(item))
      # remove at word if it is in the array
      @listreceipt.without_at_array(@manip.remove_at(@listreceipt.return_split_array))
      # popping price from array and turning it from string to float
      @listreceipt.price(@manip.get_price(@listreceipt.return_without_at))
		end
	end

	def user_input
		puts "Enter a sentence (type EXIT to finish)"
			input = gets.chomp
			if input == "EXIT"
				@done = true
			else
				@listreceipt.add_new(input)
				#@receipt << input
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