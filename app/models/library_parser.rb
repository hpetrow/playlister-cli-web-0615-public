require 'pry'

class LibraryParser
  # code here
  attr_accessor :files

  def initialize
    @path = 'db/data'
    @files = []
    load_files
  end

  def load_files
    Dir.new(@path).each {|file|
      next if file == '.' or file == '..'
      @files << file
    }
  end

  def parse_filename(filename)
    [].tap { |parts|
      parts << (filename.match(/\A.+-/)).to_s.gsub(/\s-/, "")
      parts << (filename.match(/-.+\[/)).to_s.gsub(/-\s/, "").gsub(/\s\[/, "")
      parts << (filename.match(/\[.+\]/)).to_s.gsub(/[\[\]]/, "")
    }
  end

  def build_song(artist, song, genre)
    artist = Artist.create_by_name(artist)
    song = Song.create_by_name(song)
    song.genre = Genre.create_by_name(genre)
    artist.add_song(song)
    song
  end

  def call
    @files.each { |file|
      parts = parse_filename(file)
      build_song(parts[0], parts[1], parts[2])
    }
  end
end
