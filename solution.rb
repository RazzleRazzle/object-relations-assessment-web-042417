#1
class Customer
  attr_accessor :first_name, :last_name, :reviews
  @@all = []

  def initialize(first_name, last_name)
    @reviews = []
    @first_name = first_name
    @last_name  = last_name
    @@all << self.full_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect { |n| n.full_name == name}
  end

  def self.find_all_by_first_name(name)
    self.all.collect do |n|
      if n.split('')[0] == name
        n
      end
    end
  end

  def self.all_names
    self.all.collect do |n|
      n.split('')[0]
    end
  end

  def add_review(restaurant, content)
    r = Review.new(self, restaurant)
    @reviews << r
    r.customer = self
  end
end

#2
class Review
  attr_accessor :customer, :restaurant
  @@all = []

  def initialize(customer, restaurant)
    @customer = customer
    @restaurant = restaurant
    @@all << self
  end

  def self.all
    @@all
  end

  def customer
    self.customer = @customer
  end

  def restaurant
    @restaurant
  end
end

#3
class Restaurant
  attr_accessor :name, :reviews, :customers
  @@all = []

  def initialize(name)
    @name = name
    @reviews = []
    @customers = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect {|r| r.name == name }
  end

  def reviews
    @reviews
  end

  def customers
    @customers
  end
end
