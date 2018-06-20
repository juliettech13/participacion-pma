class Legislation < ApplicationRecord
  has_many :sections
  belongs_to :consultation
end
