class Apartments::Nyc
  attr_accessor :name, :address, :rooms, :cost #create reader & writer methods  for these attributes

  def self.nyc #return data from initialize method
    self.scrape_apts
    #scrape apartment data from site and return results
    
  end

  def self.scrape_apts #instance method make use of url saved in object
    apts = [] #instance variable to trace and access scraping objects

    apts << self.scrape_apartments
    #creating scraper instance being saved to apt_scraper variable which stores instance of a scraper
    #return instance of scraper that runs url saved on  this instance
    apts << self.scrape_zillow
    apts << self.scrape_trulia
    
    apts
  end

  def self.scrape_apartments
    html = Nokogiri::HTML(open("...")) 
      #use the Rubygem Nokogiri to parse the data from the site.
    apt = self.new
    apt.name = html.search("placardTitle js-placardTitle  ").text.strip
    apt.address = html.search("location").text.strip
    apt.rooms = html.search("...").text.strip
    apt.cost = html.search("altRentDisplay").text.strip
    
    <a class="placardTitle js-placardTitle  " href="https://www.apartments.com/4530-broadway-new-york-ny-unit-4a/vns0vhd/" title="4530 Broadway Unit 4A, New York, NY">
4530 Broadway Unit 4A</a>
<div class="location" title="New York, NY 10040">New York, NY 10040</div>
<span class="altRentDisplay">$1,525</span>

    apt
  end
  
   def self.scrape_zillow
    html = Nokogiri::HTML(open("..."))

    apt = self.new
    apt.name = html.search("...").text.strip
    apt.address = html.search("...").text.strip
    apt.rooms = html.search("...").text.strip
    apt.cost = html.search("...").text.strip
   

    apt
  end
  
   def self.scrape_trulia
    html = Nokogiri::HTML(open("..."))

    apt = self.new
    apt.name = html.search("...").text.strip
    apt.address = html.search("...").text.strip
    apt.rooms = html.search("...").text.strip
    apt.cost = html.search("...").text.strip
   
    apt
  end

end
