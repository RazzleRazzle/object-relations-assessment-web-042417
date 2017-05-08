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
