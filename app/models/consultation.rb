class Consultation < ApplicationRecord
  belongs_to :legislation
  belongs_to :user
  has_many :answers
end
