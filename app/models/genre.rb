class Genre
  # code here
  attr_accessor :name, :songs, :artists

  @@genres = []

  def initialize
    @@genres << self
    @songs = []
    @artists = []
  end

  def self.create_by_name(name)
    genre = self.new
    genre.name = name
    genre
  end

  def self.find_by_name(name)
    @@genres.bsearch{|genre| genre.name == name}
  end

  def self.all
    @@genres
  end

  def self.count
    @@genres.length
  end

  def self.reset_all
    @@genres = []
  end
end
