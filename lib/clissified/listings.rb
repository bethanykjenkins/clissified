class Clissified::Listings
  attr_accessor :address, :rooms, :rent #create reader & writer methods for these attributes

 @@all = []

  def initialize (address)
    @address = address
    @@all << self
  end
  
    output = {}

  doc = Nokogiri::HTML(open("https://www.uniqlo.com/us/en/men/sale"))
  apt_address = doc.css("div.product-tile-info")

  apt_address.each do |unit|
    
    apt_rent = product.css("div.product-pricing span.product-standard-price").text
    apt_details = product.css("div.product-pricing span.product-sales-price").text
    
    output[apt_address.to_sym] = {
      :apt_rent => apt_rent,
      :apt_details => apt_details
    }
  end

  output

end
  
  def self.all
    @@all
  end

end


