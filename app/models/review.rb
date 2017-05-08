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
