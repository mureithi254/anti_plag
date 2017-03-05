class AddUrlAndContentToPlag < ActiveRecord::Migration[5.0]
  def change
    add_column :plags, :url, :string
    add_column :plags, :content, :text
  end
end
