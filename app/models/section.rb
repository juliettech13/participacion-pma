class Section < ApplicationRecord
  has_many :clauses
  belongs_to :legislation
end
