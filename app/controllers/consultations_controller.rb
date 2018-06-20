class ConsultationsController < ApplicationController
  before_action :set_consultation, only: [:show, :destroy]

  # def index
  #   @consultations = Consultation.all
  # end

  def show
  end

  def new
    @consultation = Consultation.new
  end

  # def edit
  # end

  def create
    @consultation = Consultation.new(consultation_params)
    @legislation = legislation.find(params[:legislation_id])

    respond_to do |format|
      if @consultation.save
        format.html { redirect_to @consultation, notice: 'Consultation was successfully created.' }
        format.json { render :show, status: :created, location: @consultation }
      else
        format.html { render :new }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @consultation.update(consultation_params)
  #       format.html { redirect_to @consultation, notice: 'Consultation was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @consultation }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @consultation.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

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
