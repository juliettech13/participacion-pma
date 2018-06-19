class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :content
      t.references :question, foreign_key: true
      t.references :clause, foreign_key: true
      t.references :consultation, foreign_key: true

      t.timestamps
    end
  end
end
