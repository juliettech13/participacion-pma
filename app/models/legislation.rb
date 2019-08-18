class Legislation < ApplicationRecord
  has_many :titles
  belongs_to :user

  def capitalized_title
    self.title.split.each { |word| word.capitalize }.join(" ")
  end
end
