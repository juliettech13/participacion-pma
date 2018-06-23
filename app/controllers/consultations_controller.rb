class ConsultationsController < ApplicationController


  before_action :set_consultation, only: [:show, :destroy]
  before_action :authenticate_user!, only: [:create]


  # def index
  #   @consultations = Consultation.all
  # end

  def show
  end

  def new
    @consultation = Consultation.new
    @legislation = Legislation.find(1)
    #   respond_to do |format|
    #     format.html  # new.html.erb
    #     format.json  { render :json => @user }
    # end
  end


  # def edit
  # end


  def create
    # should redirect to the start of the consultation, which is the legislation/show.
    @consultation = Consultation.new(consultation_params)
#     @legislation = legislation.find(params[:legislation_id])
    @consultation.legislation_id = Legislation.find(1).id
    @consultation.user_id = current_user.id


    respond_to do |format|
      raise
      if @consultation.save
        flash[:success] = "Thanks! I'll be in touch soon!"
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
