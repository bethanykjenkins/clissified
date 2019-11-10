class Clissified::CLI

  def call
    apt_list
    menu
    goodbye
  end

  def apt_list
    puts "Let's find your dream apartment!"
    @apts = Apartments::Scraper.nyc
    @apts.each.with_index(1) do |apt, i|
      puts "#{i}. #{apt.address}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "To see more details about an apartment enter the corresponding number, to see the complete list of apartments type list, or type exit."

      if input.to_i > 0
        unit = @apts[input.to_i-1]
        puts "This apartment is located at #{unit.address} | It has #{unit.rooms} rooms| The monthly rent for this unit is #{unit.rent}"
      elsif input == "list"
        apt_list
      else
        puts "Don't see anything you like? Type list to go back to the list or exit to quit your search for today."
      end
    end
  end

  def goodbye
    puts "New apartments are listed daily. Check back soon for more!"
  end
end
