class Title < ApplicationRecord
  has_many :chapters
  belongs_to :legislation
  has_many :articles, through: :chapters

  before_save :capitalized_title

  def capitalized_title
    splitted_title = description.split
    new_title = splitted_title.map do |word|
      word == 'Y' ? word = 'y' : word.capitalize!
    end.join(" ")
    self.description = new_title
  end
end
