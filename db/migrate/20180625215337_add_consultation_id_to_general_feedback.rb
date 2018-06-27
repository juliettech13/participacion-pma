class AddConsultationIdToGeneralFeedback < ActiveRecord::Migration[5.2]
  def change
    add_reference :general_feedbacks, :consultation, foreign_key: true
  end
end
