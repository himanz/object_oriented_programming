class Tax
end

class Manipulation
end

class Command
  def initialize
    @receipt = []
  end
  def run
    done = false
    while !done
      puts "Please enter a line(type EXIT when you are done)"
      input = gets.chomp
      if input == "EXIT"
        done = true
      else
        @receipt << input
      end
    end
    print @receipt
  end
end

jon = Command.new
jon.run