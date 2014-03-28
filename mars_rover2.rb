class Rover

  DIRECTIONS = %w(N E S W)

  NORTH = 0
  EAST = 1
  SOUTH = 2
  WEST = 3

  def initialize(x,y,direction)
    @x = x
    @y = y
    @direction = direction
  end

  def move
    if @direction == "N"
      @y += 1
    elsif @direction == "E" 
      @x += 1
    elsif @direction == "S"
      @y -= 1
    elsif @direction == "W"
      @x -= 1
    end
  end

  def turn_right
    if @direction == "N"
      @direction = "E"
    elsif @direction == "E"
      @direction = "S"
    elsif @direction == "S"
      @direction = "W"
    elsif @direction == "W"
      @direction = "N"
    end
  end

  def turn_left
    if @direction == "N"
      @direction = "W"
    elsif @direction == "W"
      @direction = "S"
    elsif @direction == "S"
      @direction = "E"
    elsif @direction == "E"
      @direction = "N"
    end
  end

  def to_s
    "#{@x} #{@y} #{@direction}"
  end

end

class Commander
  X = 0
  Y = 1
  DIRECTION = 2

  def create_rover(starting_point)
    coords = starting_point.split(" ")
    @rover = Rover.new(coords[X].to_i, coords[Y].to_i, coords[DIRECTION])
  end

  def move_rover(move_command)
    move_command.split("").each do |c|
      if c == "L"
        @rover.turn_left
      elsif c == "R"
        @rover.turn_right
      elsif c == "M"
        @rover.move
      end
    end
  end

  def final_location
    puts @rover.to_s
  end
end

command = Commander.new
command.create_rover("1 2 N")
command.move_rover("LMLMLMLMM")
command.final_location

command2 = Commander.new
command2.create_rover("3 3 E")
command2.move_rover("MMRMMRMRRM")
command2.final_location