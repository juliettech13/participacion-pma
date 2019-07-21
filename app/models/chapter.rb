class Clause < ApplicationRecord
  belongs_to :section
  has_many :questions
  has_many :subclauses

  def number_of_answers_introduction
    question_array = []
    self.questions.each do |question|
      if question.content == "Is this exciting for your country?"
        question.answers.each do |answer|
          question_array.push(answer)
        end
      end
      end
      return question_array.count
  end

  # Total amount of answers

  def number_of_answers_representation
      question_array = []
      self.questions.each do |question|
        if question.content == "How well does this represents your views?"
          question.answers.each do |answer|
            question_array.push(answer)
          end
        end
        end
      return question_array.count
  end

  def number_of_answers_suggestions_yes
    question_array = []
    self.questions.each do |question|
      if question.content == "Would you like to provide a suggestion?"
        question.answers.each do |answer|
          if answer.content == "yes"
          question_array.push(answer)
        end
        end
      end
    end
      return question_array.count.to_i
  end

 def number_of_answers_suggestions_no
    question_array = []
    self.questions.each do |question|
      if question.content == "Would you like to provide a suggestion?"
        question.answers.each do |answer|
          if answer.content == "no"
          question_array.push(answer)
        end
      end
    end
    end
      return question_array.count.to_i
  end

# DOESN'T WORK - ALWAYS GET AN 'division by 0 error'

  def percentage_of_answer_suggestions_yes
    # total = number_of_answers_suggestions_yes + number_of_answers_suggestions_no
    # return total
    # result = ((number_of_answers_suggestions_yes * 100) / total)
    # return result
  end

  def percentage_of_answer_suggestions_no
    # total = number_of_answers_suggestions_yes + number_of_answers_suggestions_no
    # return total
    # result = ((number_of_answers_suggestions_no * 100) / total)
    # return result
  end

  # Total amount of answers

  def number_of_answers_goaldriven
    question_array = []
    self.questions.each do |question|
      if question.content == "Does this achieve ICT greatness for the country?"
        question.answers.each do |answer|
          question_array.push(answer)
        end
      end
      end
      return question_array.count
  end

  def number_of_revisions
    question_array = []
    self.questions.each do |question|
      if question.content == "Please suggest your revision"
        question.answers.each do |answer|
          question_array.push(answer)
        end
      end
      end
      return question_array
  end

  def content_of_revisions
    question_array = []
    self.questions.each do |question|
      if question.content == "Please suggest your revision"
        question.answers.each do |answer|
          question_array.push(answer.content)
        end
      end
      end
      return question_array
  end

# NEEDS TO BE REVIEWED - ONLY PROVIDES THE FIRST STRING

  def frequency_of_revisions
      question_array = []
      self.questions.each do |question|
        if question.content == "Please suggest your revision"
          question.answers.each do |answer|
            question_array.push(answer.content)
          end
        end
        end
        return question_array.group_by(&:to_s).values.max_by(&:size).try(:first)
  end

# NEW % calculation yes/no

#  def division_of_answers_goaldriven
#    question_array_yes = []
#    question_array_no = []
#    self.questions.each do |question|
#      if question.content == 'does this achieve ict greatness for the country?'
#        question.answers.each do |answer|
#          if
#            answer.content == 'yes'
#            question_array_yes.push(answer)
#          else
#            question_array_no.push(answer)
#          end
#        end
#      end
#      end
#     # return question_array.count
#  # end
#  #end

#  # def percentage_of_answers_goaldriven   # --> needs to be part of the function to use 'question_array_yes'
#    total = number_of_answers_goaldriven
#    percentage_yes = (question_array_yes.count / total)*100
#    percentage_no = (question_array_no.count / total)*100
#  end

# CALCULATION % of 1/2/3/4/5 as answers

#  def percentage_of_answers_representation
#    question_array_1 = []
#    question_array_2 = []
#    question_array_3 = []
#    question_array_4 = []
#    question_array_5 = []

#    self.questions.each do |question|
#      if question.content == 'How well does this represents your views?'
#        question.answers.each do |answer|
#          case
#            when answer.content == '1' then question_array_1.push(answer)
#            when answer.content == '2' then question_array_2.push(answer)
#            when answer.content == '3' then question_array_3.push(answer)
#            when answer.content == '4' then question_array_4.push(answer)
#            when answer.content == '5' then question_array_5.push(answer)
#          end
#        end
#      end
#      end
#
#    total = number_of_answers_representation
#    percentage_1 = (question_array_1.count.to_i * 100) / total
#    percentage_2 = (question_array_2.count.to_i * 100) / total
#    percentage_3 = (question_array_3.count.to_i * 100) / total
#    percentage_4 = (question_array_4.count.to_i * 100) / total
#    percentage_5 = (question_array_5.count / total)*100
#  end

# CALCULATION % of 1/2/3/4/5 as answers

def percentage_of_answers_goaldriven
end

end
