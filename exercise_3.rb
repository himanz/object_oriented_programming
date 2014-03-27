# sentence.split to get each word seperately in an array

# in a method use .include? books, food, medical products to see
# if except from tax

# do the same for imported goods .include? for additional sales tax

# delete at from the array to get it set up to create a hash
# start of array to -2 will be the key
# array -1 will be the value (need to add sales tax to this) 

class Taxes
  
  def initialize(items)
  	@items = items
  end

  def sentence_split
  	arr = []
  	@items.each do |item|
      arr << item.split(" ")
  	end

  	return arr
  end

  def remove_at(item_arr)
    item_arr.each {|x| x.delete("at")}
    return item_arr
  end
  
  def tax_calc(item_arr)
  	tax = 0
  end

  def go
    arr2 = []
    arr = self.remove_at(self.sentence_split)
    puts "\n" 
    arr.each { |x| arr2 << x.join(" ") }
      
    
    
    print arr2 
  end
end

input1 = Taxes.new(["1 book at 12.49", "1 music CD at 14.99", 
	                  "1 chocolate bar at 0.85"])
input1.go