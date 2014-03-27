class Taxes
  def initialize(items)
  	@items = items
  end

  def sentence_split(sentence)
  	arr = []
  	sentence.each do |item|
      arr << item.split(" ")
  	end
  	@items = arr
  end
  
  def remove_at(item_arr)
    item_arr.each {|x| x.delete("at")}
    return item_arr
  end

  def go
  	sentence_split(@items)
  	remove_at(@items)
  	joining(@items)
  	print @items
  end

  def joining(item_arr)
  	arr2 = []
  	item_arr.each { |x| arr2 << x.join(" ")}
  	@items = arr2
  end
end

input1 = Taxes.new(["1 book at 12.49", "1 music CD at 14.99", 
	                  "1 chocolate bar at 0.85"])

input1.go