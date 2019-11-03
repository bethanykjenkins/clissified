class Scraper
    attr_reader :url

    @@all = []

    def initialize(url)
        @url = url
    end

    def scrape_apts
        html = Nokogiri::HTML(open(url))
        html.css("span.ft0c2").each do |desc|
            description_text = desc.text.strip
            Nyc.new(description_text)
        end
    end

end

apt_scraper = Scraper.new('https://va.siameserescue.org/webbuild.php?type=adoptme&page=1&state=')
apt_scraper.scrape_apts

binding.pry