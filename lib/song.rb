require 'pry'
require_relative 'artist'
require_relative 'concerns/memorable'
require_relative 'concerns/findable'


class Song
  attr_accessor :name
  attr_reader :artist

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Findable::ClassMethods

  @@songs = []

  # def initialize
  #   @@songs << self
  # end
  #
  # def self.find_by_name(name)
  #   @@songs.detect{|a| a.name == name}
  # end
  #
  def self.all
    @@songs
  end
  #
  # def self.reset_all
  #   self.all.clear
  # end
  #
  # def self.count
  #   self.all.count
  # end

  def artist=(artist)
     @artist = artist
     artist.add_song(self) unless artist.songs.include?(self)
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end
end
