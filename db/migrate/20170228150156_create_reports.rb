class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :report_file
      t.references :link, foreign_key: true

      t.timestamps
    end
  end
end
