class Plag < ApplicationRecord
  include Anemon

  belongs_to :doc
  belongs_to :user

  @anemon = Anemon::Scrapper.new

  def self.scrap(url)
    result = @anemon.scrap(url)
    Plag.create({url: result[:url], content: result[:content]}) if result
  end

  def self.compare(scrapped_file , uploaded_document)
    @anemon.compare(scrapped_file ,uploaded_document.attachment.path)
  end
end
