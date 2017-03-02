class Plag
  include Anemon

  @anemon = Anemon::Scrapper.new

  def self.scrap(url)
    @anemon.scrap(url)
  end

  def self.compare(file_name)
    @anemon.compare(url)
  end
end
