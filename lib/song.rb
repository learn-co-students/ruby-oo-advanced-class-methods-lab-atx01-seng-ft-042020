class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create 
    song = Song.new
    self.all << song
    return song
  end

  def initialize(name=nil)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    return song
  end

  def self.find_by_name(name)
    self.all.find {|e| e.name == name}
  end

  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    found !=nil ? found : self.create_by_name(name)
  end

  def self.alphabetical
    return self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    parsed = filename.gsub(/.mp3/, "").split("-")
    song = Song.new
    song.name = parsed[1].strip
    song.artist_name = parsed[0].strip
    return song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    return song
  end

  def self.destroy_all
    @@all = []
  end
end