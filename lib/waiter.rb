class Waiter
    @@all = []
    attr_accessor :name, :years_of_exp
    def initialize(name, years_of_exp)
        @name = name
        @years_of_exp = years_of_exp
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        largest_tip = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
        largest_tip.customer
    end


end