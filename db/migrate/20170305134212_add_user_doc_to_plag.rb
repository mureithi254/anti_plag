class AddUserDocToPlag < ActiveRecord::Migration[5.0]
  def change
    add_reference :plags, :user, foreign_key: true
    add_reference :plags, :doc, foreign_key: true
  end
end
