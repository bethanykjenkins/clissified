
class Clissified::Listings
  attr_accessor :address, :rooms, :rent #create reader & writer methods for these attributes

  def self.nyc 
    #class method
    
    self.scrape_apts
    
    #scrape apartment data from site and return results
    
  end

  def self.scrape_apts #instance method make use of url saved in object
    apts = [] #instance variable to trace and access scraping objects

    #creating scraper instance being saved to apt_scraper variable which stores instance of a scraper
    #return instance of scraper that runs url saved on  this instance
    apts << self.scrape_trulia
    apts << self.scrape_zillow
    
    apts
  end

   def self.scrape_trulia
    html = Nokogiri::HTML(open("https://www.trulia.com/for_rent/Manhattan,NY/0-1500_price/APARTMENT,APARTMENT_COMMUNITY,APARTMENT%7CCONDO%7CTOWNHOUSE,CONDO,COOP,LOFT,TIC_type/"))

    apt = self.new
    
    apt.address = html.search("div.Text__TextBase-sc-1i9uasc-0-div Text__TextContainerBase-sc-1i9uasc-1").text.strip
    apt.rooms = html.search("div.Text__TextBase-sc-1i9uasc-0-div Text__TextContainerBase-sc-1i9uasc-1").text.strip
    apt.rent = html.search("div.Text__TextBase-sc-1i9uasc-0-div Text__TextContainerBase-sc-1i9uasc-1").text.strip
   binding.pry
    apt
  end
  
   def self.scrape_zillow
    html = Nokogiri::HTML(open("https://www.zillow.com/homes/Manhattan-New-York-NY_rb/"))

    apt = self.new
    apt.address = html.search("h3.list-card-addr").text.strip
    apt.rooms = html.search("ul.list-card-details").text.strip
    apt.rent = html.search("div.list-card-price").text.strip

    apt
  end

end
