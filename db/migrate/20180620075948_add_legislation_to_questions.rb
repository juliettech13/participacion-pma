class AddLegislationToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :legislation, foreign_key: true
  end
end
