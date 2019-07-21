class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user, through: :consultation

  # validates :content, presence: true, length: { minimum: 1 }
end
