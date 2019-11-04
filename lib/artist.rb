require 'pry'
require_relative 'song'
require_relative 'concerns/memorable'
require_relative 'concerns/findable'


class Artist

  attr_accessor :name
  attr_reader :songs

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Findable::ClassMethods

  @@artists = []

  def initialize
    # @@artists << self
    super
    @songs = []
  end

  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end

  def self.all
     @@artists
  end

  # def self.reset_all
  #   self.all.clear
  # end
  #
  # def self.count
  #   self.all.count
  # end

  def add_song(song)
    @songs << song
    Song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end
end
