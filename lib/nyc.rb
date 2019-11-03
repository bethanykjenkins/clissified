class Nyc

    @@all = []

    def initialize(address)
        @address = address
        #gives ability to be initialized using address
        @@all << self
        #save them as they are created so append at end at the class variable
    end

    def self.all
      #class reader to expose class variable
        @@all
    end

end