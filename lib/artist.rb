class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def self.create(name)
    new(name)
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def add_song(song)
    self.songs << song unless self.songs.detect { |s| s.name == song.name }
    song.artist = self unless song.artist == self
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end
end
