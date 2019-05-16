class SignPetitionsController < ApplicationController
  before_action :set_sign_petition, only: [:show, :edit, :update, :destroy]

  # GET /sign_petitions
  # GET /sign_petitions.json
  def index
    @sign_petitions = SignPetition.all
  end

  # GET /sign_petitions/1
  # GET /sign_petitions/1.json
  def show
  end

  # GET /sign_petitions/new
  def new
    @sign_petition = SignPetition.new
  end

  # GET /sign_petitions/1/edit
  def edit
  end

  # POST /sign_petitions
  # POST /sign_petitions.json
  def create
    @sign_petition = SignPetition.new(sign_petition_params)

    respond_to do |format|
      if @sign_petition.save
        format.html { redirect_to @sign_petition, notice: 'Sign petition was successfully created.' }
        format.json { render :show, status: :created, location: @sign_petition }
      else
        format.html { render :new }
        format.json { render json: @sign_petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sign_petitions/1
  # PATCH/PUT /sign_petitions/1.json
  def update
    respond_to do |format|
      if @sign_petition.update(sign_petition_params)
        format.html { redirect_to @sign_petition, notice: 'Sign petition was successfully updated.' }
        format.json { render :show, status: :ok, location: @sign_petition }
      else
        format.html { render :edit }
        format.json { render json: @sign_petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sign_petitions/1
  # DELETE /sign_petitions/1.json
  def destroy
    @sign_petition.destroy
    respond_to do |format|
      format.html { redirect_to sign_petitions_url, notice: 'Sign petition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sign_petition
      @sign_petition = SignPetition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sign_petition_params
      params.require(:sign_petition).permit(:petition_id, :full_name, :email, :remark)
    end
end
