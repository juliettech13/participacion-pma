class CreateGeneralFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :general_feedbacks do |t|
      t.text :content
      t.references :legislation, foreign_key: true

      t.timestamps
    end
  end
end
