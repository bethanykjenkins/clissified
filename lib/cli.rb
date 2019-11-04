class Clissified::CLI

  def call
    apt_list
    menu
    goodbye
  end

  def apt_list
    puts "Let's find your dream apartment!"
    @apts = Apartment::Nyc.new_york
    @apts.each.with_index(1) do |apt, i|
      puts "#{i}. #{apt.address} - #{apt.cost}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the apartment you'd like to learn more about, type list to see all of the apartments again or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        unit = @apts[input.to_i-1]
        puts "#{unit.name} | #{unit.price}"
      elsif input == "list"
        apt_list
      else
        puts "Don't see anything you like? Type list to go back to the list or exit."
      end
    end
  end

  def goodbye
    puts "New apartments are listed daily. Check back for more!"
  end
end
