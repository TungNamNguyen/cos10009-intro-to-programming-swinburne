require './input_functions'

# Task 6.1 T - use the code from 5.1 to help with this

class Track
	attr_accessor :name, :location

	def initialize (name, location)
		@name = name
		@location = location
	end
end

# Reads in and returns a single track from the given file

def read_track(music_file)
	
	name = music_file.gets()
  	location = music_file.gets() 
  	track = Track.new(name,location)
  	return track 
end

# Returns an array of tracks read from the given file

def read_tracks(music_file)	
	count = music_file.gets().to_i()
  	tracks = Array.new()
	i = 0
	while i < count 
	track = read_track(music_file)
  	tracks << track
	i +=1
	end 
	return tracks
end



def print_tracks(tracks)
	x = 0
	while (x < tracks.length)
	print_track(tracks[x])
	x +=1
end
end

def print_track(track)
  	puts(track.name)
	puts(track.location)
end

def search_for_track_name(tracks, search_string)
	i = 0
	while i < tracks.length
	 if tracks[i].name.chomp == search_string.chomp
	 found_index = i 
	 end
	 i +=1
	end
  return found_index
end

def main()
  	music_file = File.new("album.txt", "r")
	tracks = read_tracks(music_file)  	
	print_tracks(tracks)
  	search_string = read_string("Enter the track name you wish to find: ")
  	index = search_for_track_name(tracks, search_string)
  	if index > -1
   		puts "Found " + tracks[index].name + " at " + index.to_s()
  	else
    	puts "Entry not Found"
  	end
end

main()

