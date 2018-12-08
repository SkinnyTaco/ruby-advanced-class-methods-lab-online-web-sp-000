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
    
  end

end
