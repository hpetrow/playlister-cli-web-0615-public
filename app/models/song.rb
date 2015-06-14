class Song
  # code here
  attr_accessor :name, :artist
  attr_reader :genre
  @@songs = []

  def initialize
    @@songs << self
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

  def to_s
    "#{artist.name} - #{@name} [#{@genre.name}]"
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@songs.bsearch{|song| song.name == name}
  end

  def self.all
    @@songs
  end

  def self.count
    @@songs.length
  end

  def self.reset_all
    @@songs = []
  end
end
