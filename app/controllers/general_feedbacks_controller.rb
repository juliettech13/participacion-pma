class GeneralFeedbacksController < ApplicationController
  before_action :authenticate_user!

  def show
    @general_feedback = GeneralFeedback.find(params[:id])
  end

  def new
    @consultation = Consultation.find(params[:consultation_id])
    @general_feedback = GeneralFeedback.new
  end

  def create
    @general_feedback = GeneralFeedback.new(general_feedback_params)
    @consultation = Consultation.find(params[:consultation_id])
    if @general_feedback.save!
      redirect_to consultation_path(@consultation)
    else
      render :new
    end
  end

  private

  def general_feedback_params
    params.require(:general_feedback).permit(:content, :consultation_id)
  end
end
