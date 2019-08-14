class Subarticle < ApplicationRecord
  belongs_to :article
  has_many :subsubarticles
end
