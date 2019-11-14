class Scraper #general scraper
    attr_reader :address, :cost, :details, :url 
    #reader for instance variable

    @@all = [] #class variable to trace and access scraping objects

    def initialize(url) #initialzie new scraping object
        @url = url #instance variable
    end

    def scrape_apts
      #instance method make use of url saved in scraper object
      
      self.url #returns data from initialize method
      
        html = Nokogiri::HTML(open(url))
        #reads content at url and saves to variable as a file object need to use nokogiri to parse it
        #parse through html file and turn it into objects similar to nested hash with nodes to make it easier to find elements to get needed data
        
        html.css("placardTitle js-placardTitle  ").each do |addr|
            address_text = addr.text.strip
            #local variable
          
            
            Nyc.new(address_text)
            #create apartment using Nyc class. instantiate apt passing in description held in local variable. everytime we iterate over apt description we create a new apt. slowely building apt instance for each apt. 
        end
    end

end

apt_scraper = Scraper.new('https://www.apartments.com/apartments/new-york-ny/under-1700/?bb=mi7j_458wHzszmkvH')
#creating scraper instance being saved to apt_scraper variable which stores instance of a scraper
#return instance of scraper that runs url saved on  this instance

apt_scraper.scrape_apts
#take url and do specific scraping and return data
binding.pry
