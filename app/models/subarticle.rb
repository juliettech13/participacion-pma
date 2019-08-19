class Subarticle < ApplicationRecord
  belongs_to :article
  has_many :subsubarticles

  def spaced_content
    self.content.gsub("/n", "<br><br>")
  end
end
