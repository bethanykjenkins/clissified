
class Clissified::Listings
  attr_accessor :address, :rent, :rooms

  @@all = []

  def initialize
    self.all << self
  end

  def self.all
    @@all
  end

end
