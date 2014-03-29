class Tax
  @@total_tax = 0

  def initialize(unit_cost)
    @unit_cost = unit_cost
    @unit_tax = 0
  end

  # calculate taxes and prices
  def calc_tax(tax_rate)
    unit_and_tax = (@unit_cost * tax_rate).round(2)
    price_round = (unit_and_tax * 20).ceil / 20.0
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

  # split the sentence into single words
  def split_to_single
    @receipt.split(" ")
  end
 
  # join the array to form a sentence
  def join_words(input)
    return input.join(" ")
  end

  # remove the at word
  def remove_at(input)
    input.delete_if {|x| x == "at" }
  end
  
  # determines if luxury tax is applicable
  def luxury(input)
    if input.include? "imported"
      return 0.05
    else 
      return 0
    end
  end

  # determines if the item is exempt from basic tax
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

  # at 0 to the number cause ruby doesnt output 0 at the end after decimal
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
        # Original price of unit
        price = split_sentence[-1].to_f
        @taxes = Tax.new(price)
        # Remove at
        at_removed = @manip.remove_at(split_sentence)
        # calculates luxury tax rate
        luxury_rate = @manip.luxury(at_removed)
        # calculates basic tax rate
        basic_rate = @manip.basic(at_removed)
        # final tax rate
        tax_rate = (luxury_rate + basic_rate)
        # calculate unit price with tax
        unit_tax = @taxes.calc_tax(tax_rate)
        # tax price for the unit
        tax_for_unit = (@taxes.tax_for_unit)
        # remove the last item from array
        at_removed.pop
        # makes the array into a sentence
        whole_sentence = @manip.join_words(at_removed)
        # adds to total price
        @total += (price + tax_for_unit)
        # price with tax for the unit
        price_string = (price + tax_for_unit).round(2).to_s
        # appends the correct output to user to an array
        @editted_receipt << whole_sentence + ":" + " #{@manip.add_zero(price_string)}"
      end
    end

    puts "\e[H\e[2J"
    # outputs the correct format 
    puts @editted_receipt
    # outputs sales taxes
    puts "Sales Taxes: #{@manip.add_zero(@taxes.tax_total.to_s)}"
    # outputs total price
    puts "Total: #{@manip.add_zero(@total.round(2).to_s)}"
  end
end

jon = Command.new
jon.run