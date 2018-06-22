class Question < ApplicationRecord
  belongs_to :clause
  has_many :answers
end
