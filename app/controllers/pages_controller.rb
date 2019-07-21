class PagesController < ApplicationController
  def home
    @legislation = Legislation.find(2)
  end


  def finished
    @consultation = Consultation.find_by(user_id: current_user.id)
  end

  # def dashboard
  #   @sections = Section.all
  #   #@clause = Clause.where(params[section_id:])
  #   @clauses = Clause.all
  # end

  #  def dashboard_2
  #   @sections = Section.all
  #   #@clause = Clause.where(params[section_id:])
  #   @clauses = Clause.all
  #   @questions = Question.all
  # end
end
