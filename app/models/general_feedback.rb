class GeneralFeedback < ApplicationRecord
  # has_one :legislation, through: :consultation
  # has_one :user, through: :consultation
  belongs_to :consultation
  validates :consultation, presence: true
  validates :content, presence: true, allow_blank: false
end
