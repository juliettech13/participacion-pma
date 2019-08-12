class Metadatum < ApplicationRecord
  belongs_to :article
  has_many :metadatum_subarticles
end
