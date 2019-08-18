class Metadatum < ApplicationRecord
  belongs_to :article
  has_many :metadatum_subarticles

  def spaced_content
    self.content.gsub("/n", "<br><br>")
  end
end
