class GeneralFeedbackController < ApplicationController
  before_action :authenticate_user!

  def show
    @general_feedback = General_feedback.find(params[:id])
  end

  def new
    @general_feedback = General_feedback.new
  end

  def create
    @general_feedback = General_feedback.new(general_feedback_params)
  end

  private

  def general_feedback_params
    params.require(:general_feedback).permit(:content, :legislation_id)
  end
end
