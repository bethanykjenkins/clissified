class Clissified::Listings
  attr_accessor :address, :rooms, :rent #create reader & writer methods for these attributes

 @@all = []

  def initialize (address)
    @address = address
    @@all << self
  end
  
  def self.all
    @@all
  end

end
