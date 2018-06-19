class Legislation < ApplicationRecord
  has_many :sections
  belongs_to :user,  optional: true
end
