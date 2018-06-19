class CreateClauses < ActiveRecord::Migration[5.2]
  def change
    create_table :clauses do |t|
      t.string :content
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end
