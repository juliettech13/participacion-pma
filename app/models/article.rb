class Article < ApplicationRecord
  belongs_to :chapter
  has_many :questions
  has_many :metadata
  has_many :subarticles


  def integer
    number.to_i
  end

  def new_art_number
    number.to_s.split('.').last.to_i
  end

  def spaced_content
    self.content.gsub("/n", "<br><br>")
  end

  # def compare(metadata)
  #   array_of_words = content.split
  #   array_of_words.each do |word|
  #     if !metadata.first.content.include?(word)
  #       return "!#{word}"
  #   end
  # end

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



  def percentage_of_answers_goaldriven
  end

end
