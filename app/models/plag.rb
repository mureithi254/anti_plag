class Plag < ApplicationRecord
  include Anemon
 
  belongs_to :doc
  belongs_to :user

  @anemon = Anemon::Scrapper.new

  def self.scrap(url)
    result = @anemon.scrap(url)
    Plag.create({url: result[:url], content: result[:content], filename: result[:filename]}) if result
  end

  def self.check_for_plagiarism(scrapped_file , uploaded_document)
    @anemon.check_for_plagiarism(scrapped_file ,uploaded_document)
  end
end
