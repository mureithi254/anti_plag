class Plag < ApplicationRecord
  include Anemon
 
  belongs_to :doc
  belongs_to :user

  @anemon = Anemon::Scrapper.new

  def self.crawl_and_scrap(url ,user ,doc) 
    result = @anemon.crawl_and_scrap(url ,user ,doc)
    Plag.create({url: result[:url], content: result[:content], filename: result[:filename], user: user, doc: doc}) if result
  end

  def self.check_for_plagiarism(scrapped_file , uploaded_document)
    @anemon.check_for_plagiarism(scrapped_file ,uploaded_document)
  end
end
