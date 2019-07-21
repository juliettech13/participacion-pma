class Title < ApplicationRecord
  has_many :chapters
  belongs_to :legislation
  has_many :articles, through: :chapters
end
