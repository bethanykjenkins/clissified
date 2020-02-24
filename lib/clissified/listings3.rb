
class Clissified::Listings
  attr_accessor :address, :rent, :rooms

  @@all = []

  def initialize
    self.nyc.all << self
  end
  
  
  def list_apt
    self.scrape_apts.each do |post|
      apt = Clissified::Listings.new
      apt.address = post.css("address.list-card-addr").text
      apt.rent = post.css("div.list-card-price").text
      apt.rooms = post.css("li").text
    end
  end

  def self.nyc
    @@all
  end

end
