class CreateSubsubarticles < ActiveRecord::Migration[5.2]
  def change
    create_table :subsubarticles do |t|
      t.text :content
      t.integer :number
      t.references :subarticle, foreign_key: true

      t.timestamps
    end
  end
end
