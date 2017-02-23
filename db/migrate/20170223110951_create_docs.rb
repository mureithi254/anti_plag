class CreateDocs < ActiveRecord::Migration[5.0]
  def change
    create_table :docs do |t|
      t.string :name
      t.string :attachment
      t.references :user ,foreign_key: true

      t.timestamps
    end
  end
end
