class ConsultationsController < ApplicationController

  before_action :set_consultation, only: [:show, :destroy]
  before_action :authenticate_user!, only: [:create]

  def show
  end

  def new
    @legislation = Legislation.find(params[:legislation_id])
    @consultation = Consultation.new
  end

  def create
    # should redirect to the start of the consultation, which is the legislation/show.
    @consultation = Consultation.new(consultation_params)
    @legislation = Legislation.find(params[:legislation_id])

    if current_user == nil
      redirect_to new_user_registration_path
    else
      @consultation.user_id = current_user.id
      @consultation.legislation_id = @legislation.id
    end
    @consultation.save!
    redirect_to legislation_path(@legislation)
  end

  def destroy
    @consultation.destroy
    respond_to do |format|
      format.html { redirect_to consultations_url, notice: 'Consultation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultation
      @consultation = Consultation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consultation_params
      params.require(:consultation).permit(:user_id, :legislation_id)
    end
end
