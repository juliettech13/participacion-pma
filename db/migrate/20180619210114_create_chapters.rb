class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.string :description
      t.integer :number
      t.references :title, foreign_key: true

      t.timestamps
    end
  end
end
