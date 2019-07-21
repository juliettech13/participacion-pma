class CreateTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :titles do |t|
      t.integer :number
      t.text :description
      t.references :legislation, foreign_key: true

      t.timestamps
    end
  end
end
