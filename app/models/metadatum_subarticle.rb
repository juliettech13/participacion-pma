class MetadatumSubarticle < ApplicationRecord
  belongs_to :metadatum

  def spaced_content
    self.content.gsub("/n", "<br><br>")
  end
end
