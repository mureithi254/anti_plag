class Doc < ApplicationRecord
	mount_uploader :attachment, AttachmentUploader #tells rails to use uploader for this model.
    validates :name, presence: true #Make sure the owner's name is present.	

end
