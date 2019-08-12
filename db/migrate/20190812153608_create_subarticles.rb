class CreateSubarticles < ActiveRecord::Migration[5.2]
  def change
    create_table :subarticles do |t|
      t.text :content
      t.integer :number
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
