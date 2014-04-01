#work on line 184
class Price
  @@total_tax = 0
  @@price_and_tax = 0

	def unit_tax(price, tax)
    @unit_tax = (((price * tax * 20.0).ceil)/20.0).round(2)
    @@total_tax += @unit_tax 
	end

	def price_add_tax(price, tax)
		@price_with_tax = (price + tax).round(2)
    @@price_and_tax += @price_with_tax
	end

	def total_price
	end

  def return_unit_tax
  	return @unit_tax
  end

  def return_price_add_tax
  	return @price_with_tax
  end

	def total_tax
		return @@total_tax
  end

  def total_price_with_tax
  	return @@price_and_tax
  end
end

class Tax
	def luxury_tax(array)
		array.each do |word|
			if word == "imported"
				@lux_tax = 0.05
				return
			end
		end
		@lux_tax = 0
	end

	def basic_tax(array)
		exempt = ["book", "chocolate", "chocolates", "pills"]
		exempt.each do |word|
      if array.include?(word)
      	@bas_tax = 0
      	return
      end
    end
    @bas_tax = 0.1
	end

	def lux_tax
		return @lux_tax
	end

	def bas_tax
		return @bas_tax
	end

	def total_tax
		return @lux_tax + @bas_tax
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

	def join_sentence(sentence, price)
		join = sentence.join(" ")
		join = join + ": " + "#{price}"
		return join
	end

	def get_price(sentence)
		return sentence.pop
	end
end	

class ListReceipt
	@@formatted_sentence = []
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

  def joined_sentence(input)
  	@joined_sentence = input
  end

  def return_joined_sentence
  	return @joined_sentence
  end

  def add_formatted_sentence(sentence)
    @@formatted_sentence << sentence
  end

  def return_formatted_sentence(price, sales_tax, total)
  	@@formatted_sentence.each {|x| puts "#{x}: #{price}"}
  	puts "Sales Taxes: #{sales_tax.round(2)}"
		puts "Total: #{total.round(2)}"
  end

  def hello
  	print @@formatted_sentence
  end
end

class User
	def run
		@listreceipt = ListReceipt.new
		@manip = Manipulation.new
		@tax = Tax.new
		@price = Price.new
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
      # got price, now can do manipulation
      # find tax rate
      @tax.luxury_tax(@listreceipt.return_without_at)
      @tax.basic_tax(@listreceipt.return_without_at)
      #@tax.total_tax
      # calc tax on each unit
      @price.unit_tax(@listreceipt.return_price, @tax.total_tax)
      # calc price added with tax
      @price.price_add_tax(@listreceipt.return_price, @price.return_unit_tax)
      # join the array to create sentence

      #work on line 184
      @listreceipt.joined_sentence(@manip.join_sentence(@listreceipt.return_split_array,price.return_price_add_tax))
      @listreceipt.add_formatted_sentence(@listreceipt.return_joined_sentence) 

		end
		#@manip.display_formatted_sentence(@listreceipt.return_joined_sentence, @price.return_price_add_tax, @price.total_tax, @price.total_price_with_tax)
		@listreceipt.return_formatted_sentence(@price.return_price_add_tax, @price.total_tax, @price.total_price_with_tax)
    
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