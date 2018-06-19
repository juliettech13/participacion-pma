class CreateConsultations < ActiveRecord::Migration[5.2]
  def change
    create_table :consultations do |t|
      t.references :legislation, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
