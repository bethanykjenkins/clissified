class Scraper

  def scrape_apts
    doc = Nokogiri::HTML(open("https://www.zillow.com/homes/Manhattan-New-York-NY_rb/"))
  end

end
