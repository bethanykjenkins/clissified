class Clissified::Listings

	@@all = [ ]
	attr_accessor :address #create reader & writer methods for these attributes
	attr_reader :rent, :details

	def initialize (address, rent, details)
		@address  = address
		@rent = rent
		@details = details
		@@all << self #initialize method adds each instance to the array to keep track of what we created
	end

	def self.all
		@@all
	end

end


