class GovernmentBodiesController < ApplicationController
  before_action :set_government_body, only: [:show, :edit, :update, :destroy]

  # GET /government_bodies
  # GET /government_bodies.json
  def index
    @government_bodies = GovernmentBody.all
  end

  # GET /government_bodies/1
  # GET /government_bodies/1.json
  def show
  end

  # GET /government_bodies/new
  def new
    @government_body = GovernmentBody.new
  end

  # GET /government_bodies/1/edit
  def edit
  end

  # POST /government_bodies
  # POST /government_bodies.json
  def create
    @government_body = GovernmentBody.new(government_body_params)

    respond_to do |format|
      if @government_body.save
        format.html { redirect_to government_bodies_path, notice: 'Government body was successfully created.' }
        format.json { render :show, status: :created, location: @government_body }
      else
        format.html { render :new }
        format.json { render json: @government_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /government_bodies/1
  # PATCH/PUT /government_bodies/1.json
  def update
    respond_to do |format|
      if @government_body.update(government_body_params)
        format.html { redirect_to government_bodies_path, notice: 'Government body was successfully updated.' }
        format.json { render :show, status: :ok, location: @government_body }
      else
        format.html { render :edit }
        format.json { render json: @government_body.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /government_bodies/1
  # DELETE /government_bodies/1.json
  def destroy
    @government_body.destroy
    respond_to do |format|
      format.html { redirect_to government_bodies_url, notice: 'Government body was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_government_body
      @government_body = GovernmentBody.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def government_body_params
      params.require(:government_body).permit(:government_body_type_id, :name, :region_id, :city, :url, :email, :phone, :description)
    end
end
