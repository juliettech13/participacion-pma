class LegislationsController < ApplicationController
  before_action :set_legislation, only: [:show, :edit, :update, :destroy]

  def index
    @legislations = Legislation.all
  end

  def show
    @consultation = Consultation.find_by(user_id: current_user.id)
    @answer = Answer.new
    # @questions = Question.where(:clause_id => @legislation.sections.each(&:clauses)).all
  end

  def download_pdf
    send_file "#{Rails.root}/public/docs/CONSTITUCION-REFORMAS-2019.pdf", type: "application/pdf", x_sendfile: true
  end

  def new
    @legislation = Legislation.new
  end

  def edit
  end

  def create
    @legislation = Legislation.new(legislation_params)

    respond_to do |format|
      if @legislation.save
        format.html { redirect_to @legislation, notice: 'Legislation was successfully created.' }
        format.json { render :show, status: :created, location: @legislation }
      else
        format.html { render :new }
        format.json { render json: @legislation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @legislation.update(legislation_params)
        format.html { redirect_to @legislation, notice: 'Legislation was successfully updated.' }
        format.json { render :show, status: :ok, location: @legislation }
      else
        format.html { render :edit }
        format.json { render json: @legislation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @legislation.destroy
    respond_to do |format|
      format.html { redirect_to legislations_url, notice: 'Legislation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legislation
      @legislation = Legislation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legislation_params
      params.fetch(:legislation, {})
    end
end
