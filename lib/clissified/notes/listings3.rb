
class Clissified::Listings
  attr_accessor :name, :breed, :details

  @@all = []

  def initialize(descrpition)
    @description = description
    @@all << self
  end

  def self.all
    @@all
  end

end
