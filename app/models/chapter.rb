class Chapter < ApplicationRecord
  belongs_to :title
  # has_many :questions
  has_many :articles

end
