class AddDocAndUserToPlags < ActiveRecord::Migration[5.0]
  def change
    add_column :plags, :doc, :integer
    add_column :plags, :user, :integer
  end
end
