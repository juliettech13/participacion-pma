class ConsultationsController < ApplicationController
  before_action :set_consultation, only: [:show, :edit, :update, :destroy]

  # GET /consultations
  # GET /consultations.json
  def index
    @consultations = Consultation.all
  end

  # GET /consultations/1
  # GET /consultations/1.json
  def show
  end

  # GET /consultations/new
  def new
    @consultation = Consultation.new
  end

  # GET /consultations/1/edit
  def edit
  end

  # POST /consultations
  # POST /consultations.json
  def create
    @consultation = Consultation.new(consultation_params)

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

  # PATCH/PUT /consultations/1
  # PATCH/PUT /consultations/1.json
  def update
    respond_to do |format|
      if @consultation.update(consultation_params)
        format.html { redirect_to @consultation, notice: 'Consultation was successfully updated.' }
        format.json { render :show, status: :ok, location: @consultation }
      else
        format.html { render :edit }
        format.json { render json: @consultation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consultations/1
  # DELETE /consultations/1.json
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
      params.fetch(:consultation, {})
    end
end
