class Scraper

  def scrape_apts
    doc = Nokogiri::HTML(open("https://www.zillow.com/homes/Manhattan-New-York-NY_rb/"))
      apt = self.new
  end

  def list_apt
    self.scrape_apts.each do |post|
      apt = Clissified::Listings.new
      apt.address = post.css("address.list-card-addr").text
      apt.rent = post.css("div.list-card-price").text
      apt.rooms = post.css("li").text
    end
  end

end
