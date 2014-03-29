class Tax
  @@total_tax = 0

  def initialize(unit_cost)
    @unit_cost = unit_cost
    @unit_tax = 0
  end

  def calc_tax(tax_rate)
    raw_value = (@unit_cost * tax_rate).round(2)
    rounded_value = (raw_value * 20).ceil / 20.0
    @unit_tax = rounded_value
    @@total_tax += @unit_tax
    return rounded_value
  end

  def tax_for_unit
    @unit_tax
  end

  def tax_total
    @@total_tax
  end
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
      return 0.05
    else 
      return 0
    end
  end

  def basic(input)
    tax = 0.10
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
  def run
    done = false
    while !done
      puts "Please enter a line(type EXIT when you are done)"
      input = gets.chomp
      if input == "EXIT"
        done = true
      else
        @manip = Manipulation.new(input)
        # Setting up values to use do manipulation
        split_sentence = @manip.split_to_single
        price = split_sentence[-1].to_f
        @taxes = Tax.new(price)
        at_removed = @manip.remove_at(split_sentence)
        luxury_rate = @manip.luxury(at_removed)
        basic_rate = @manip.basic(at_removed)
        tax_rate = (luxury_rate + basic_rate).round(2)
        puts "lux is #{luxury_rate}"
        puts "basic is #{basic_rate}"
        puts "tax rate is #{tax_rate}"
        puts "-------------"
        unit_tax = @taxes.calc_tax(tax_rate)
        tax_for_unit = @taxes.tax_for_unit
        puts "Rounded unit cost #{unit_tax}"
        puts "tax for unit cost #{tax_for_unit}"
        #whole_sentence = @manip.join_words(at_removed)
        puts price
        puts "\n"
        puts @taxes.tax_total
      end
    end
    #@manip = Manipulation.new
    
  end
end

jon = Command.new
jon.run