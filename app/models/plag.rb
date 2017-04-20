class Plag < ApplicationRecord
  include Anemon
 
  belongs_to :doc
  belongs_to :user
  has_one :result

  @anemon = Anemon::Scrapper.new

  def self.crawl_and_scrap(url ,user ,doc) 
    result = @anemon.crawl_and_scrap(url ,user ,doc)
    Plag.create({url: result[:url], filename: result[:filename], user: user, doc: doc}) if result
  end
end
