class CreatePlags < ActiveRecord::Migration[5.0]
  def change
    create_table :plags do |t|

      t.timestamps
    end
    add_index :plags, unique: true
  end
end
