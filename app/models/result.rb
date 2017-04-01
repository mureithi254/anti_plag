class Result < ApplicationRecord
include Anemon
 belongs_to :user
 belongs_to :doc
 belongs_to :plag

@anemon = Anemon::Scrapper.new

def self.check_for_plagiarism(scrapped_file , uploaded_document ,user ,doc ,plag)
    plag_result = @anemon.check_for_plagiarism(scrapped_file ,uploaded_document ,user,doc,plag)
     Result.create({plagiarised_content: plag_result[:plagiarised_content] , user: user ,doc: doc ,plag: plag}) if plag_result
  end
end
