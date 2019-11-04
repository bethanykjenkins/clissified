class Apartments::Nyc
  attr_accessor :name, :cost, :address
  
  end

  def self.nyc #return data from initialize method
    self.scrape_apts
    #scrape apartment data from site and return results
    
  end

  def self.scrape_apts #instance method make use of url saved in object
    apts = [] #instance variable to trace and access scraping objects

    apts << self.scrape_apartments
    #creating scraper instance being saved to apt_scraper variable which stores instance of a scraper
    #return instance of scraper that runs url saved on  this instance

    apts
  end

  def self.scrape_apartments
    html = Nokogiri::HTML(open("https://www.apartments.com/apartments/new-york-ny/under-1700/?bb=mi7j_458wHzszmkvH"))

    apt = self.new
    apt.address = html.search("placardTitle js-placardTitle  ").text.strip
    apt.cost = html.search("...").text.strip
   

    apt
  end

end
