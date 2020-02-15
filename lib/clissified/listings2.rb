
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
    apts << self.scrape_craigslist
    apts << self.scrape_zillow
    apts << self.scrape_trulia
    
    apts
  end

  
   def self.scrape_zillow
    html = Nokogiri::HTML(open("https://www.zillow.com/manhattan-new-york-ny/rentals/?searchQueryState={%22pagination%22:{},%22usersSearchTerm%22:%22Manhattan%20New%20York%20NY%22,%22mapBounds%22:{%22west%22:-74.21047920019527,%22east%22:-73.73669379980464,%22south%22:40.60143224441118,%22north%22:40.95811350356174},%22regionSelection%22:[{%22regionId%22:12530,%22regionType%22:17}],%22isMapVisible%22:true,%22mapZoom%22:11,%22filterState%22:{%22isForSaleByAgent%22:{%22value%22:false},%22isForSaleByOwner%22:{%22value%22:false},%22isNewConstruction%22:{%22value%22:false},%22isForSaleForeclosure%22:{%22value%22:false},%22isComingSoon%22:{%22value%22:false},%22isAuction%22:{%22value%22:false},%22isPreMarketForeclosure%22:{%22value%22:false},%22isPreMarketPreForeclosure%22:{%22value%22:false},%22isMakeMeMove%22:{%22value%22:false},%22isForRent%22:{%22value%22:true},%22monthlyPayment%22:{%22max%22:1500},%22price%22:{%22max%22:403827},%22isCondo%22:{%22value%22:false},%22isMultiFamily%22:{%22value%22:false},%22isTownhouse%22:{%22value%22:false},%22isSingleFamily%22:{%22value%22:false}},%22isListVisible%22:true}"))

    apt = self.new
    apt.address = html.search("h3.list-card-addr").text.strip
    apt.rooms = html.search("ul.list-card-details").text.strip
    apt.rent = html.search("div.list-card-price").text.strip

    apt
  end
  
     def self.scrape_craigslist
    html = Nokogiri::HTML(open(""))

    apt = self.new
    apt.address = html.search("h3.list-card-addr").text.strip
    apt.rooms = 
    apt.rent = 

    apt
  end
  
   def self.scrape_trulia
    html = Nokogiri::HTML(open("https://www.trulia.com/for_rent/Manhattan,NY/0-1500_price/APARTMENT,APARTMENT_COMMUNITY,APARTMENT%7CCONDO%7CTOWNHOUSE,CONDO,COOP,LOFT,TIC_type/"))

    apt = self.new
    
    apt.address = html.search("div.property-street").text.strip
    apt.rooms = html.search("div.property-beds").text.strip
    apt.rent = html.search("div.property-price").text.strip
   
    apt
  end

end
