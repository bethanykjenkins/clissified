class Clissified::CLI

  def call
    apt_list
    menu
    goodbye
  end

  def apt_list
    puts "Let's find your dream apartment!"
    @apts = Apartment::Nyc
    @apts.each.with_index(1) do |apt, i|
      puts "#{i}. #{apt.address}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "To see the cost of an apartment enter the number, to see the complete list of apartments type list, or type exit."

      if input.to_i > 0
        unit = @apts[input.to_i-1]
        puts "#{unit.address} | #{unit.cost}"
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
