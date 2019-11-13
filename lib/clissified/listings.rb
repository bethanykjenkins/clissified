class Clissified::Listings
  attr_accessor :address, :rooms, :rent #create reader & writer methods for these attributes

  def self.nyc 
    #return data from initialize method
    
    self.scrape_apts
    
    #scrape apartment data from site and return results
    
  end

  def self.scrape_apts #instance method make use of url saved in object
    apts = [] #instance variable to trace and access scraping objects

    #creating scraper instance being saved to apt_scraper variable which stores instance of a scraper
    #return instance of scraper that runs url saved on  this instance
    apts << self.scrape_zillow
    apts << self.scrape_trulia
    
    apts
  end

  
   def self.scrape_zillow
    html = Nokogiri::HTML(open("https://www.zillow.com/manhattan-new-york-ny/rentals/?searchQueryState={%22pagination%22:{},%22usersSearchTerm%22:%22Manhattan%20New%20York%20NY%22,%22mapBounds%22:{%22west%22:-74.040174,%22east%22:-73.906999,%22south%22:40.680598,%22north%22:40.879278},%22regionSelection%22:[{%22regionId%22:12530,%22regionType%22:17}],%22filterState%22:{%22price%22:{%22min%22:0,%22max%22:435960},%22monthlyPayment%22:{%22min%22:0,%22max%22:1500},%22isForSaleByAgent%22:{%22value%22:false},%22isForSaleByOwner%22:{%22value%22:false},%22isNewConstruction%22:{%22value%22:false},%22isForSaleForeclosure%22:{%22value%22:false},%22isComingSoon%22:{%22value%22:false},%22isAuction%22:{%22value%22:false},%22isPreMarketForeclosure%22:{%22value%22:false},%22isPreMarketPreForeclosure%22:{%22value%22:false},%22isMakeMeMove%22:{%22value%22:false},%22isForRent%22:{%22value%22:true},%22isAllHomes%22:{%22value%22:true}},%22isListVisible%22:true,%22isMapVisible%22:false}"))

    apt = self.new
    apt.address = "100 st."
     #html.search("list-card-addr").text.strip
    apt.rooms = "2"
     #html.search("list-card-addr").text.strip
    apt.rent = "40"
     #html.search("list-card-details").text.strip

    apt
  end
  
   def self.scrape_trulia
    html = Nokogiri::HTML(open("https://www.trulia.com/for_rent/Manhattan,NY/0-1500_price/APARTMENT,APARTMENT_COMMUNITY,APARTMENT%7CCONDO%7CTOWNHOUSE,CONDO,COOP,LOFT,TIC_type/"))

    apt = self.new
    apt.address = "12 ave"
     #html.search("Text__TextBase-sc-1i9uasc-0-div Text__TextContainerBase-sc-1i9uasc-1 lcNNgu").text.strip
    apt.rooms = "4"
     #html.search("Text__TextBase-sc-1i9uasc-0-div Text__TextContainerBase-sc-1i9uasc-1 lcNNgu").text.strip
    apt.rent = "17"
     #html.search("MediaBlock__MediaContent-ldzu2c-1 eMnXuJ").text.strip
   
    apt
  end

end
