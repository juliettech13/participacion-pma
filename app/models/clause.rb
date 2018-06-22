class Clause < ApplicationRecord
  belongs_to :section
  has_many :questions
end
