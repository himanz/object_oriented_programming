class Taxes
  
  def initialize(items)
  	@items = item
  end
  
  def imported(sentence)
  	if sentence.include? "imported"
  		return 5
  	end
  end

  def exempt(sentence)
  	
  end
  
  def tax_rate
  end

end

class Manipulation
  
  def initialize(sentence)
  	@sentence = sentence
  end

	def sentence_split
		arr = []
  	@sentence.each do |item|
      arr << item.split(" ")
  	end
  	@sentence = arr
	end

	def joining
		arr2 = []
  	@sentence.each { |x| arr2 << x.join(" ")}
  	@sentence = arr2
	end

  def remove_at
  	return @sentence.each {|x| x.delete("at")}
  end

end

class Output
	def create_receipt(receipt)
		@receipt = Manipulation.new(receipt)
	end

	def display_tax(tax_info)
		@tax_info = Taxes.new(tax_info)
	end

  def print_r
  	puts @receipt
  end
end

#jon = Manipulation.new(["1 book at 12.49",
#	               "1 music CD at 14.99",
#	               "1 chocolate bar at 0.85"])
#jon.sentence_split
#jon.remove_at
#jon.joining

cho = Output.new
cho.create_receipt(["1 book at 12.49",
	               "1 music CD at 14.99",
	               "1 chocolate bar at 0.85"])

print cho.print_r