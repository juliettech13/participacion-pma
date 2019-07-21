class Question < ApplicationRecord
  belongs_to :article
  has_many :answers
end
