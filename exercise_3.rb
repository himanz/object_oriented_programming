class Tax
  @@total_tax = 0

  def initialize(unit_cost)
    @unit_cost = unit_cost
    @unit_tax = 0
  end

  def calc_tax(tax_rate)
    tax = (@unit_cost * tax_rate).round(2)
    num = tax + @unit_cost
    rounded_unit_price = 0
    last_digit = (num.to_s[-1]).to_i
    puts "last digit is #{last_digit}"
    if last_digit >= 6 && last_digit <= 9
      #return (num + (10.0 - last_digit) / 100).round(2)
      rounded_unit_price = (num + (10.0 - last_digit) / 100).round(2)
      @unit_tax = (rounded_unit_price - @unit_cost).round(2)
      @@total_tax += @unit_tax
      return rounded_unit_price
    elsif last_digit >=1 && last_digit <= 4
      #return (num + (5.0 - last_digit) / 100).round(2)
      rounded_unit_price = (num + (5.0 - last_digit) / 100).round(2)
      @unit_tax = (rounded_unit_price - @unit_cost).round(2)
      @@total_tax += @unit_tax
      return rounded_unit_price
    else
      rounded_unit_price = (num / 100).round(2)
      @unit_tax = (rounded_unit_price - @unit_cost).round(2)
      @@total_tax += @unit_tax
      return rounded_unit_price
    end
    #rounded_tax = (tax * 20).ceil / 20
    #@@total_tax += (@unit_cost * tax_rate) 
    #return rounded_tax
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