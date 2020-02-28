
class Clissified::Listings
  attr_accessor :name, :breed, :information #create reader & writer methods for these attributes

  def self.nyc 
    #class method
    
    self.scrape_pets
    
    #scrape apartment data from site and return results
    
  end

  def self.scrape_pets #instance method make use of url saved in object
    pets = [] #instance variable to trace and access scraping objects

    #creating scraper instance being saved to apt_scraper variable which stores instance of a scraper
    #return instance of scraper that runs url saved on  this instance
    pets << self.scrape_puppies
    
    pets
  end

   def self.scrape_puppies
    html = Nokogiri::HTML(open("https://www.adoptapet.com/adoption_rescue/89777-new-beginning-animal-rescue-bronx-new-york"))

    pet = self.new
    pet.address = html.css("grid-search-results").text.strip
    pet.rooms = html.css("ul.list-card-details").text.strip
    pet.rent = html.css("div.list-card-price").text.strip

    pet
  end

end
