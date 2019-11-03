class Nyc

    @@all = []

    def initialize(description)
        @description = description
        #gives ability to be initialized using description
        @@all << self
        #save them as they are created so append at end at the class variable
    end

    def self.all
      #class reader to expose class variable
        @@all
    end

end