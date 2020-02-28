class Scraper

  attr_reader :url
  
  @@all = [ ]

  #def self.nyc 
    #class method
   # self.scrape_pets
    #scrape apartment data from site and return results
 # end

  #def self.scrape_pets #instance method make use of url saved in object
   # pets = [] #instance variable to trace and access scraping objects
    #creating scraper instance being saved to pet_scraper variable which stores instance of a scraper
    #return instance of scraper that runs url saved on this instance
   # pets << self.scrape_puppies
    
  #  pets
  #end
  
    #def self.scrape_puppies
      # html = Nokogiri::HTML(open("https://www.adoptapet.com/adoption_rescue/89777-new-beginning-animal-rescue-bronx-new-york"))
      #  pet = self.new
      #  pet.name = html.css("div.content").text.strip

      #   pet
    #  end

   def self.scrape_puppies
    html = Nokogiri::HTML(open(url))
    html.css("div.content").each do |pet|
    pet_text = pet.text.strip
      Dog.new(pet_text)
  end

end
  
  pet_scraper = Scraper.new('https://www.adoptapet.com/adoption_rescue/89777-new-beginning-animal-rescue-bronx-new-york')
  pet_scraper.scrape_puppies
