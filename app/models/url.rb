require 'securerandom'

class URL
  @@all = []

  def initialize(url)
    @url = url
    @short_url = shorten_url(url)
    @@all << self
  end

  attr_reader :url, :short_url

  def self.all
    @@all
  end

  def shorten_url(url)
    SecureRandom.hex(2)
  end

  def self.find(param)
    @@all.find { |u| u.short_url == param }
  end
end