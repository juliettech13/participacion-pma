class CreateMetadata < ActiveRecord::Migration[5.2]
  def change
    create_table :metadata do |t|
      t.text :vision
      t.string :agency
      t.string :rationale
      t.text :status
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
