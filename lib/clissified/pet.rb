class Clissified::Pet
  attr_accessor :name, :gender_and_age, :breed
   
  def initialize(name, gender_and_age, breed)
    @name = name
    @gender_and_age = gender_and_age
    @breed = breed
    save
  end 
  
  def self.all 
    @@all 
  end
  
  def save
    @@all << self
  end
end 
