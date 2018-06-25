class PagesController < ApplicationController
  def home
    @legislation = Legislation.find(1)
  end

  def finished
    @consultation = Consultation.find_by(user_id: current_user.id)
  end
end
