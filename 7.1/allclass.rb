module Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end
$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']
class Track
	attr_accessor :name, :location
	def initialize (name, location)
		@name = name
		@location = location
	end
end
class Album
	attr_accessor :title, :artist, :genre, :tracks
	def initialize (title, artist, genre, tracks)
		# insert lines here
		@genre = genre
		@title = title 
		@artist = artist
		@genre = genre
		@tracks = tracks
	end
end
