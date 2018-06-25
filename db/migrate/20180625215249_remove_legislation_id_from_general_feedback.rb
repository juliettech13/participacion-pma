class RemoveLegislationIdFromGeneralFeedback < ActiveRecord::Migration[5.2]
  def change
    remove_reference :general_feedbacks, :legislation, foreign_key: true
  end
end
