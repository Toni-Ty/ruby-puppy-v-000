require 'pry'
# class Dog
#
#   attr_accessor :name
#
#   @@all = []
#
#   def initialize(name)
#     @name = name
#     @@all << self
#   end
#
#   def self.all
#     @@all.each do |all_dogs|
#       puts all_dogs.name
#
#   end
# end
#   def self.clear_all
#     @@all.clear
# end
#



class Person
  attr_accessor :name, :age, :company

  def self.new_from_csv(csv_data)
    rows = csv_data.split("\n")
    binding.pry
    people = rows.collect do |row|

      data = row.split(", ")
      name = data[0]
      age = data[1]
      company = data[2]

      person = self.new # This is an important line.
      person.name = name
      person.age = age
      person.company = company
      person
    end
    people
  end
end

csv_data = "Elon Musk, 45, Tesla
Mark Zuckerberg, 32, Facebook
Martha Stewart, 74, MSL"

people = Person.new_from_csv(csv_data)
people #=> [
  #<Person @name="Elon Musk"...>,
  #<Person @name="Mark Zuckerberg"...>,
  # ...
# ]

new_csv_data = "Avi Flombaum, 31, Flatiron School
Payal Kadakia, 30, ClassPass"

people << Person.new_from_csv(new_csv_data)
people.flatten
people #=> [
