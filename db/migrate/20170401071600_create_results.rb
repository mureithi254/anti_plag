class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.text :plagiarised_content	
      t.references :user ,foreign_key: true
      t.references :doc ,foreign_key: true
       t.references :plag ,foreign_key: true
      t.timestamps
    end
  end
end
