require 'pry'
require_relative "waiter.rb"
require_relative "meal.rb"
class Customer
    @@all = []
    attr_accessor :name, :age
    def initialize(name, age)
        @name = name
        @age = age
        save
    end

    def save
        @@all << self
    end

    def new_meal(waiter, total, tip=0)
       Meal.new(waiter, self, total, tip)
    end

    def self.all
        @@all
    end

    def meals
        Meal.all.select do |meal|
            meal.customer == self
        end
    end
  
    def waiters
        meals.map do |meal|
            meal.waiter
        end
    end
end