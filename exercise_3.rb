class Tax
end

class Manipulation
  def initialize(receipt)
    @receipt = receipt
  end
  def split_to_single
    #split = []
    #input.each {|x| split << x.split(" ")}
    #split
    @receipt.split(" ")
  end

  def join_words(input)
    return input.join(" ")
  end

  def remove_at(input)
    input.delete_if {|x| x == "at" }
    
  end
  
  def luxury(input)
    if input.include? "imported"
      return 5
    else 
      return 0
    end
  end

  def basic(input)
    tax = 10
    exempt = ["chocolate", "chocolates", "pills", "book"]
    exempt.each do |x|
      if input.include? x
        tax = 0
      end
    end
    return tax
  end

end

class Command
  #def initialize
  #  @receipt = []
  #end
  def run
    done = false
    while !done
      puts "Please enter a line(type EXIT when you are done)"
      input = gets.chomp
      if input == "EXIT"
        done = true
      else
        #@receipt << input
        @manip = Manipulation.new(input)
        
        # Setting up values to use do manipulation
        split_sentence = @manip.split_to_single
        price = split_sentence[-1].to_f
        at_removed = @manip.remove_at(split_sentence)
    
        luxury_rate = @manip.luxury(at_removed)
        basic_rate = @manip.basic(at_removed)
        puts "-------------"
        puts "luxury tax is #{luxury_rate}"
        puts "--------------"
        puts "basic tax is #{basic_rate}"
        puts "--------------"
        #whole_sentence = @manip.join_words(at_removed)
        puts price
        puts "\n"
        print at_removed
      end
    end
    #@manip = Manipulation.new
    
  end
end

jon = Command.new
jon.run