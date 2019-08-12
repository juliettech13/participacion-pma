class CreateMetadatumSubarticles < ActiveRecord::Migration[5.2]
  def change
    create_table :metadatum_subarticles do |t|
      t.string :content
      t.integer :number
      t.references :metadatum, foreign_key: true

      t.timestamps
    end
  end
end
