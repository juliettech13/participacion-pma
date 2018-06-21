class CreateLegislations < ActiveRecord::Migration[5.2]
  def change
    create_table :legislations do |t|
      t.string :title
      t.text :introduction
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
