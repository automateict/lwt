class ComplaintClientSatisfactionsController < ApplicationController
  before_action :set_complaint_client_satisfaction, only: [:show, :edit, :update, :destroy]

  # GET /complaint_client_satisfactions
  # GET /complaint_client_satisfactions.json
  def index
    @complaint_client_satisfactions = ComplaintClientSatisfaction.all
  end

  # GET /complaint_client_satisfactions/1
  # GET /complaint_client_satisfactions/1.json
  def show
  end

  # GET /complaint_client_satisfactions/new
  def new
    @complaint_client_satisfaction = ComplaintClientSatisfaction.new
  end

  # GET /complaint_client_satisfactions/1/edit
  def edit
  end

  # POST /complaint_client_satisfactions
  # POST /complaint_client_satisfactions.json
  def create
    @complaint_client_satisfaction = ComplaintClientSatisfaction.new(complaint_client_satisfaction_params)

    respond_to do |format|
      if @complaint_client_satisfaction.save
        format.html { redirect_to @complaint_client_satisfaction, notice: 'Complaint client satisfaction was successfully created.' }
        format.json { render :show, status: :created, location: @complaint_client_satisfaction }
      else
        format.html { render :new }
        format.json { render json: @complaint_client_satisfaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /complaint_client_satisfactions/1
  # PATCH/PUT /complaint_client_satisfactions/1.json
  def update
    respond_to do |format|
      if @complaint_client_satisfaction.update(complaint_client_satisfaction_params)
        format.html { redirect_to @complaint_client_satisfaction, notice: 'Complaint client satisfaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @complaint_client_satisfaction }
      else
        format.html { render :edit }
        format.json { render json: @complaint_client_satisfaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaint_client_satisfactions/1
  # DELETE /complaint_client_satisfactions/1.json
  def destroy
    @complaint_client_satisfaction.destroy
    respond_to do |format|
      format.html { redirect_to complaint_client_satisfactions_url, notice: 'Complaint client satisfaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint_client_satisfaction
      @complaint_client_satisfaction = ComplaintClientSatisfaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_client_satisfaction_params
      params.require(:complaint_client_satisfaction).permit(:complaint_id, :user_id, :rating, :feedback)
    end
end
