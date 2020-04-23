require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save 
    song 
  end

  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song 
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save 
    song 
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    does_song_exist = self.find_by_name(name)
    does_song_exist ? does_song_exist : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name[0]
    end
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1].split(".")[0]
    artist_name = filename.split(" - ")[0]
    song = self.find_or_create_by_name(song_name)
    song.artist_name = filename.split(" - ")[0]
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save 
  end

  def self.destroy_all
    @@all.clear 
  end

  def save
    self.class.all << self
  end


end


