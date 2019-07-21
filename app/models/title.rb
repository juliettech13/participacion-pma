class Title < ApplicationRecord
  has_many :chapters
  belongs_to :legislation
end
