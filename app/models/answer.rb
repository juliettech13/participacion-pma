class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :clause
  belongs_to :consultation
end
