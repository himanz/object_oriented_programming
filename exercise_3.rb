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
        split_sentence = @manip.split_to_single
        at_removed = @manip.remove_at(split_sentence)
        #whole_sentence = @manip.join_words(at_removed)
        
        print at_removed
      end
    end
    #@manip = Manipulation.new
    
  end
end

jon = Command.new
jon.run