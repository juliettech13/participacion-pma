class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :content
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
