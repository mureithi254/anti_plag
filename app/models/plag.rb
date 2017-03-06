class Plag < ApplicationRecord

	belongs_to :Doc
	belongs_to :User
  include Anemon

  @anemon = Anemon::Scrapper.new

  def self.scrap(url)
    result = @anemon.scrap(url)
    Plag.create({url: result[:url], content: result[:content]}) if result
  end

  def self.compare(filename ,file_name)
    @anemon.compare(filename ,file_name)
  end
end
