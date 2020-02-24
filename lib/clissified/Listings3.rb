
class Clissified::Listings
  attr_accessor :title, :schedule, :description

  @@all = []

  def initialize
    self.nyc.all << self
  end

  def self.all
    @@all
  end

end
