class Clissified::CLI

  def start
    pet_list
    menu
    goodbye
  end

  def pet_list
    puts "Let's find your new best friend!"
    @pets = Clissified::PetScraper.new.make_pets

    @pets.each.with_index(1) do |pet, i|
      puts "#{i}. #{pet.name}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "To see more details about a potential pet enter the corresponding number, to see the complete list of pets type list, or type exit."
      input = gets.strip.downcase
      
      if input.to_i > 0
        buddy = @pets[input.to_i-1]
        puts "This is #{buddy.name} | It has #{buddy.rooms} rooms| The monthly rent for this unit is #{buddy.rent}"
      elsif input == "list"
        pet_list
      else
        puts "Don't see anything you like? Type list to go back to the list or exit to quit your search for today."
      end
    end
  end

  def goodbye
    puts "New pets looking for their forever family are listed daily. Check back soon for more!"
  end
end

