class Clissified::PetScraper
   #create reader & writer methods for these attributes
  
  def make_pets
    html = Nokogiri::HTML(open("https://www.adoptapet.com/adoption_rescue/89777-new-beginning-animal-rescue-bronx-new-york"))
    dog_htmls = html.css("div.content")
    pets = []
    dog_htmls.each do |dog_html|

      pet = Clissified::Pet.new
      
      pet.name = dog_html.css('h4').text
      pet.gender_and_age = dog_html.css('p').children[0].text.strip
      pet.breed = dog_html.css('span')[0].children[1].text.strip + dog_html.css('span')[0].children[2].text.strip

    
      pets << pet
    end
    
   pets
  end



end
