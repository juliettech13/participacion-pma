class CreateSubclauses < ActiveRecord::Migration[5.2]
  def change
    create_table :subclauses do |t|
      t.text :content
      t.references :clause, foreign_key: true

      t.timestamps
    end
  end
end
