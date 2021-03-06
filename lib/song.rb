class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new 
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song.save
    song
  end
  
  def self.find_by_name(song_name)
    self.all.detect { |song| song.name == song_name }
  end
  
  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    song ? song : self.create_by_name(song_name)
  end
  
  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(song_file)
    file_array = song_file.split(" - ")
    artist_name = file_array[0]
    song_name = file_array[1].chomp(".mp3")
    song = self.new 
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(song_file)
    song = self.new_from_filename(song_file)
    song.save
  end
  
  def self.destroy_all
    self.all.clear
  end

end
