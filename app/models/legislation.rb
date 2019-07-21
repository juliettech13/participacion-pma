class Legislation < ApplicationRecord
  has_many :titles
  belongs_to :user
end
