require 'pry'

class Artist
  # code here
  attr_accessor :name
  attr_reader :songs, :genres

  @@artists = []

  def initialize
    @@artists << self
    @songs = []
    @genres = []
  end

  def add_song(song)
    @songs << song
    song.artist = self
    if song.genre
      @genres << song.genre
      song.genre.artists << self if !song.genre.artists.include?(self)
    end
  end

  def add_songs(songs)
    songs.each{|song| add_song(song)}
  end

  def self.create_by_name(name)
    artist = self.new
    artist.name = name
    artist
  end

  def self.find_by_name(name)
    @@artists.bsearch{|artist| artist.name == name}
  end

  def self.all
    @@artists
  end

  def self.count
    @@artists.length
  end

  def self.reset_all
    @@artists = []
  end
end
