class Taxes
  def initialize(items)
  	@items = items
  end

  # Split the sentence into an array of words
  def sentence_split(sentence)
  	arr = []
  	sentence.each do |item|
      arr << item.split(" ")
  	end
  	@items = arr
  end
  
  # Remove the at word as it is useless
  def remove_at(item_arr)
    item_arr.each {|x| x.delete("at")}
    return item_arr
  end

  # Join the array together to create the product 
  def joining(item_arr)
  	arr2 = []
  	item_arr.each { |x| arr2 << x.join(" ")}
  	@items = arr2
  end
  
  # Calculate the tax rate
  def tax_calc
  	basic = ["book", "chocolate", "chocolates", "pills"]
  	
  	# Go through each sentence of word to find specific words to determine tax
  	@items.each do |sentence|
  		# To see if it is exempt from basic tax or not
  		basic_tax = true
  		tax = 0
  		
  		# Looks for imported for luxary tax
  		if sentence.include?("imported")
  			tax += 5
  		end

      # Go through each keyword exempt from basic tax
      basic.each do |x|      	
  	    if sentence.include? x
  	    	basic_tax = false
  	    	break    
  	    end
  		end

  		if basic_tax == true
  			tax += 10
  		end

      # Append the tax rates to each sentence 
      sentence << tax
  	end  
  end

  def tax_sales
  	taxes = []
  	@items.each do |x|
      tax = x.pop
      if tax != 0
        taxes << (x[-1].to_f * tax)/100 
      end
      
    end
    print taxes
   # print taxes
  end

  def go
  	sentence_split(@items)
  	remove_at(@items)
  	tax_calc
  	#print @items
  	tax_sales
  	#joining(@items)
  	#print @items
  end
  
end

input1 = Taxes.new(["1 book at 12.49", "1 music CD at 14.99", 
	                  "1 chocolate bar at 0.85"])
input2 = Taxes.new(["1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99",
                    "1 packet of headache pills at 9.75", 
                    "1 box of imported chocolates at 11.25"])

input1.go
input2.go