class Clissified::Pet
  attr_accessor :name, :gender_and_age, :breed

  @@all = []
  
  def all
    @@all << pets
  end
  
  def save
    @@all << self
  end
  
   def self.all
    @@all
  end
end
