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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ||
    self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    songFile = filename.split(/[-.]+/)
    song_new = self.new_by_name(songFile[1].strip)
    song_new.artist_name = songFile[0].strip
    song_new
  end

  def self.create_from_filename(filename)
    songFile = filename.split(/[-.]+/)
    song_new = self.create_by_name(songFile[1].strip)
    song_new.artist_name = songFile[0].strip
    song_new
  end

  def self.destroy_all
    @@all = []
  end

end
