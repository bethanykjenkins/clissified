class Nyc

    @@all = []

    def initialize(description)
        @description = description
        @@all << self
    end

    def self.all
        @@all
    end

end