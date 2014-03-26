class Person
	def initialize(name)
		@name = name
	end

	def greeting
		puts "Hi, my name is #{@name}"
	end
end

class Student < Person
	def learn
		puts "I get it!"
	end
end

class Instructor < Person
	def teach
		puts "Everything in Ruby is an Object"
	end
end

chris = Instructor.new("Chris")
chris.greeting
puts "\n"

christina = Student.new("Christina")
christina.greeting
puts "\n"

chris.teach
puts "\n"

christina.learn
puts "\n"

christina.teach
# teach method does not work on student instance as there is no teach method in
# the Student class or Person class.  Error is NoMethodError.

