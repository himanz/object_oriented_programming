class Tax
  @@total_tax = 0

  def initialize(unit_cost)
    @unit_cost = unit_cost
    @unit_tax = 0
  end

  def calc_tax(tax_rate)
    unit_and_tax = (@unit_cost * tax_rate).round(2)
    price_round = (unit_and_tax * 10).ceil / 10.0
    @unit_tax = price_round
    @@total_tax += @unit_tax
    return price_round
  end

  def tax_for_unit
    @unit_tax.round(2)
  end

  def tax_total
    @@total_tax.round(2)
  end
end

class Manipulation
  def initialize(receipt)
    @receipt = receipt
  end
  def split_to_single
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

  def add_zero(input)
    if input[-3] != "."
       result = input + "0"
       return result
    end
    return input
  end
end

class Command
  def initialize
    @editted_receipt = []
    @total = 0
  end
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
        tax_rate = (luxury_rate + basic_rate)
        unit_tax = @taxes.calc_tax(tax_rate)
        tax_for_unit = (@taxes.tax_for_unit)
        at_removed.pop
        whole_sentence = @manip.join_words(at_removed)
        @total += (price + tax_for_unit)
        price_string = (price + tax_for_unit).round(2).to_s
        @editted_receipt << whole_sentence + ":" + " #{@manip.add_zero(price_string)}"
      end
    end
    puts "\e[H\e[2J"
    puts @editted_receipt
    puts "Sales Taxes: #{@manip.add_zero(@taxes.tax_total.to_s)}"
    puts "Total: #{@manip.add_zero(@total.round(2).to_s)}"
  end
end

jon = Command.new
jon.run