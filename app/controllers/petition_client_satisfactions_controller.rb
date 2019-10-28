class PetitionClientSatisfactionsController < ApplicationController
  before_action :set_petition_client_satisfaction, only: [:show, :edit, :update, :destroy]

  # GET /petition_client_satisfactions
  # GET /petition_client_satisfactions.json
  def index
    @petition_client_satisfactions = PetitionClientSatisfaction.all
  end

  # GET /petition_client_satisfactions/1
  # GET /petition_client_satisfactions/1.json
  def show
  end

  # GET /petition_client_satisfactions/new
  def new
    @petition_client_satisfaction = PetitionClientSatisfaction.new
  end

  # GET /petition_client_satisfactions/1/edit
  def edit
  end

  # POST /petition_client_satisfactions
  # POST /petition_client_satisfactions.json
  def create
    @petition_client_satisfaction = PetitionClientSatisfaction.new(petition_client_satisfaction_params)

    respond_to do |format|
      if @petition_client_satisfaction.save
        format.html { redirect_to @petition_client_satisfaction.petition, notice: 'Client feedback was successfully submitted.' }
        format.json { render :show, status: :created, location: @petition_client_satisfaction }
      else
        format.html { render :new }
        format.json { render json: @petition_client_satisfaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /petition_client_satisfactions/1
  # PATCH/PUT /petition_client_satisfactions/1.json
  def update
    respond_to do |format|
      if @petition_client_satisfaction.update(petition_client_satisfaction_params)
        format.html { redirect_to @petition_client_satisfaction.petition, notice: 'Client feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @petition_client_satisfaction }
      else
        format.html { render :edit }
        format.json { render json: @petition_client_satisfaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /petition_client_satisfactions/1
  # DELETE /petition_client_satisfactions/1.json
  def destroy
    @petition_client_satisfaction.destroy
    respond_to do |format|
      format.html { redirect_to petition_client_satisfactions_url, notice: 'Petition client satisfaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_petition_client_satisfaction
      @petition_client_satisfaction = PetitionClientSatisfaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def petition_client_satisfaction_params
      params.require(:petition_client_satisfaction).permit(:petition_id, :rating, :feedback)
    end
end
