class CreateScraps < ActiveRecord::Migration[5.0]
  def change
    create_table :scraps do |t|
      t.string :scrap_file
      t.references :link, foreign_key: true

      t.timestamps
    end
  end
end
