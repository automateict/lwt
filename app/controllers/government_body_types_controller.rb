class GovernmentBodyTypesController < ApplicationController
  before_action :set_government_body_type, only: [:show, :edit, :update, :destroy]

  # GET /government_body_types
  # GET /government_body_types.json
  def index
    @government_body_types = GovernmentBodyType.all
  end

  # GET /government_body_types/1
  # GET /government_body_types/1.json
  def show
  end

  # GET /government_body_types/new
  def new
    @government_body_type = GovernmentBodyType.new
  end

  # GET /government_body_types/1/edit
  def edit
  end

  # POST /government_body_types
  # POST /government_body_types.json
  def create
    @government_body_type = GovernmentBodyType.new(government_body_type_params)

    respond_to do |format|
      if @government_body_type.save
        format.html { redirect_to @government_body_type, notice: 'Government body type was successfully created.' }
        format.json { render :show, status: :created, location: @government_body_type }
      else
        format.html { render :new }
        format.json { render json: @government_body_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /government_body_types/1
  # PATCH/PUT /government_body_types/1.json
  def update
    respond_to do |format|
      if @government_body_type.update(government_body_type_params)
        format.html { redirect_to @government_body_type, notice: 'Government body type was successfully updated.' }
        format.json { render :show, status: :ok, location: @government_body_type }
      else
        format.html { render :edit }
        format.json { render json: @government_body_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /government_body_types/1
  # DELETE /government_body_types/1.json
  def destroy
    @government_body_type.destroy
    respond_to do |format|
      format.html { redirect_to government_body_types_url, notice: 'Government body type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_government_body_type
      @government_body_type = GovernmentBodyType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def government_body_type_params
      params.require(:government_body_type).permit(:name, :description)
    end
end
