
class Clissified::Listings
  attr_accessor :address, :rent, :rooms

  @@all = []

  def initialize
    self.nyc.all << self
  end

  def self.all
    @@all
  end

end
