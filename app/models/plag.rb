class Plag < ApplicationRecord
  include Anemon

  @anemon = Anemon::Scrapper.new

  def self.scrap(url)
    result = @anemon.scrap(url)
    Plag.create({url: result[:url], content: result[:content]}) if result
  end

  def self.compare(file_name)
    @anemon.compare(url)
  end
end
