require './input_functions'
module Genre # Define enumaration Genre
  POP, CLASSIC, JAZZ, ROCK = *1..4
end

class Track # Define Track data type
	attr_accessor :name, :location
	def initialize (name, location)
		@name = name
		@location = location
	end
end

$genre_names = ['Null', 'Pop', 'Classic', 'Jazz', 'Rock']

class Album # Define Album data type
    attr_accessor :artist, :title, :genre, :tracks
	def initialize (artist,title,genre)
		@artist =artist
		@title = title
        @genre=$genre_names[genre]
        @tracks=Array.new()
	end
end

def read_tracks(music_file)
  count = music_file.gets().to_i()
  tracks = Array.new()
  i = 0 
  while i < count 
  track = Track.new(music_file.gets, music_file.gets)
  tracks << track
  i +=1
  end 
  return tracks
end

def read_albums(music_file)
    if !music_file
    puts "No album!"
    else
     count = music_file.gets.to_i
     albums = Array.new()

      index = 0
      while (index < count)
          album = Album.new(music_file.gets.chomp, music_file.gets.chomp, music_file.gets.chomp.to_i )
          album.tracks=read_tracks(music_file)
          albums << album 
          index += 1
      end
      music_file.close()
      return albums

end
end

def print_albums(albums)
 if !albums
 puts "No albums to display"
 else
    puts("1.Display all: ")
    puts("2.Display by genre: ")
  choice = read_integer_in_range("Please select your choice:", 1,2)
  case choice
    when 1
         index = 0
           while index < albums.length
              puts "Album ID:#{index+1}"
              puts albums[index].genre
              puts "Title is "+albums[index].title
              puts "Artist is "+albums[index].artist
              index += 1
           end
    when 2
      puts ('Please select:')
      puts ('1.Pop')
      puts ('2.Classic')
      puts ('3.Jazz')
      puts ('4.Rock')    
      id = read_integer_in_range("Select your genre:",1,4)
        index = 0
        while index < albums.length 
          if albums[index].genre == $genre_names[id]
            puts ("Album ID:#{index+1}")
            puts albums[index].genre
            puts "Title is "+albums[index].title
            puts "Artist is "+albums[index].artist
          else
            puts("No Album")                 
        end 
        index +=1
      end 
    end 
    
  read_string("Press enter to continue")
  end
end 
def play_albums(albums)
      if (!albums)
      puts "No albums to play"
      else
      puts "Play Albums"
      puts "1.Play by ID"
      puts "2.Search"
      choice = read_integer_in_range("Please enter your choice:",1,2)
  case choice
  when 1
      id=read_integer_in_range("Album ID:",1,albums.length)
      puts "Track list:"
      index = 0
      while (index < albums[id-1].tracks.length )
          puts "#{index+1}. #{albums[id-1].tracks[index].name}"
          index += 1
      end
      choice1 = read_integer_in_range("Play Track: ",1,albums[id-1].tracks.length)
      puts "Playing track #{albums[id-1].tracks[choice1-1].name.chomp} from album #{albums[id-1].title}"      
      read_string("Press enter to continue")   
  when 2
      puts "1.Search by Genre"
      puts "2.Search by Title"
      option = read_integer_in_range("Option:",1,2)
      case option
      when 1
      puts ('Select Genre:')
      puts ('1.Pop')
      puts ('2.Classic')
      puts ('3.Jazz')
      puts ('4.Rock')   
      id = read_integer_in_range("Select your genre:",1,4)
        index = 0
        while index < albums.length          
          if albums[index].genre == $genre_names[id]
          puts "Album ID:#{index+1}"
          puts albums[index].genre
          puts "Title is "+albums[index].title
          puts "Artist is "+albums[index].artist
          end 
          index +=1
        end 
      i = 0 
       index = 0
        while i < albums.length           
          if albums[i].genre == $genre_names[id]      
      play=read_integer_in_range("Play Album Id:",1,4)
      puts "Track list:"
      i = 0 
      while i < albums[play-1].tracks.length
        puts "#{i+1}. #{albums[play-1].tracks[i].name}"
        i +=1
      end 
      choice = read_integer_in_range("Play Track:",1,albums[play-1].tracks.length)
      puts "Playing track #{albums[play-1].tracks[choice-1].name.chomp} from album #{albums[id-1].title}"
      puts "Press enter to continue"
  else 
  puts "No track"  
  end 
  i +=1
  end        
      when 2 
        title=read_string("Title: ")
            for i in 1..(albums.length)
                if albums[i-1].title.chomp == title.chomp
                    found = true
                    puts "Track list:"
                    for j in 0..(albums[i-1].tracks.length - 1)
                        puts "#{j+1}. #{albums[i-1].tracks[j].name}"
                    end
                    choice=read_integer_in_range("Play Track: ",1,albums[i-1].tracks.length)                    
                    puts "Playing track #{albums[i-1].tracks[choice-1].name.chomp} from album #{albums[i-1].title}"                  
                    puts "Press enter"
                    
                else 
                found = false
                return found
                end
            end
    if found == false 
    puts "No track found!!!"
    end
    end 
  end 
  end
end                   
def update_album(albums)
   if (!albums)
   puts "No albums to update!!"
   else
    album_menu = true
    while (album_menu== true)
        index= 0
        mod_menu= true
        x = change_menu(albums)
        while (index < albums.length && mod_menu == true)
            index +=1
            if (x == (index + 1))
                puts ("Current Title: " +albums[index].title)
                puts ("Current Genre: " +albums[index].genre.to_s)
                puts "1: Update Title"
                puts "2: Update Genre"
                puts "3: Return"
            menu_choice = read_integer_in_range("Please select an option: ", 1, 3)

            case menu_choice
            when 1
                albums[x - 1].title = read_string("Enter updated title: ")
                puts ("Updated Title is: " + albums[x- 1].title)
                mod = false
            when 2
                albums[x - 1].genre = read_string("Enter updated genre: ")
                puts ("Updated Genre is: " + albums[x- 1].genre)
                mod_menu = false
            when 3
                mod_menu = false
        end
        elsif x == (albums.length+ 1)
          mod_menu = false
          album_menu = false
        end
        end
      end 
    return albums
    end
end
def change_menu(albums)
    puts "Change title or genre of album"
    index = 0
    count = albums.length
    while (index < count)
        puts "Albums #{index +1} Details: "
        puts ("Title: " + albums[index].title)
        puts ("Genre: " + albums[index].genre.to_s)
        index += 1
    end
    puts "Album:"
    index = 0
    while (index < count)
        puts "#{index + 1}: " + albums[index].title.chomp
        index += 1
    end
    puts("#{index + 1}: Exit")
    x = read_integer_in_range("Menu Choice: ", 1, (index + 1))
    return x
end

 def main_menu(finished, albums)
    finished = false
    while finished == false  
      puts "Main Menu:"
      puts "1. Read in Album"
      puts "2. Display Album Information"
      puts "3. Play Album"
      puts "4. Update Album"
      puts "5. Exit"
      choice = read_integer_in_range("Please enter your choice: ", 1, 5)     
      case choice
        when 1
          file_name = read_string("Filename: ")
          if file_name == "albums.txt"
            music_file = File.new(file_name, "r")
            albums = read_albums(music_file)  
          else
            puts("Invalid music file to read")
          end        
        when 2
          print_albums(albums)         
        when 3
          play_albums(albums)         
        when 4
          albums = update_album(albums)         
        when 5
          puts "Close Text Music Player"
          finished = true
      end
    end
  end

  def main()
    finished = false;
    albums = nil
    main_menu(finished, albums)
  end

  main()
