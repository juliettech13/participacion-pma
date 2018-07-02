class Answer < ApplicationRecord
  belongs_to :question
  # belongs_to :clause, through: :question
  # belongs_to :consultation
  belongs_to :user

  validates :content, presence: true
end
