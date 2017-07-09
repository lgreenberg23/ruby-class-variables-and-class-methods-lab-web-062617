require 'pry'

class Song
	attr_accessor :name, :artist, :genre#, :count, :artists, :genres, :all

	@@count = 0
	@@artists = []
	@@genres = []
	@@all = []


	def initialize(name, artist, genre)
		@name = name
		@artist = artist
		@genre = genre
		
		# @@all << self
		self.save
	end

	def self.all
		@@all
		# binding.pry
	end

	def self.count
		@@count
	end

	def self.artists
		@@artists.uniq
	end

	def self.genres
		@@genres.uniq
	end

	def self.all_genres
		@@genres.sort
	end

	def self.all_artists
		@@artists.sort
	end


	def save
		@@artists << @artist
		@@count +=1
		@@genres << @genre
		self.class.all << self
	end

	def self.genre_count
		# genre_count = {}
		# @@genres.each { |genre| genre_count[genre] = 0}
		# genre_count = self.all_genres.each_with_object(Hash.new(0)) { |genre,counts| counts[genre] += 1 }
		self.genres.map{|t| [t,self.all_genres.count(t)]}.to_h
		# genre_count
	end

	def self.artist_count
		artist_count = self.artists.map{|a| [a,self.all_artists.count(a)]}.to_h
	end

end

