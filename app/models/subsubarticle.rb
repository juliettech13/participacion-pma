class Subsubarticle < ApplicationRecord
  belongs_to :subarticle

  def spaced_content
    self.content.gsub("/n", "<br><br>")
  end
end
