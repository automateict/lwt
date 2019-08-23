class PetitionReviewMembersController < ApplicationController
  before_action :set_petition_review_member, only: [:show, :edit, :update, :destroy]

  # GET /petition_review_members
  # GET /petition_review_members.json
  def index
    @petition_review_members = PetitionReviewMember.all
  end

  # GET /petition_review_members/1
  # GET /petition_review_members/1.json
  def show
  end

  # GET /petition_review_members/new
  def new
    @petition_review_member = PetitionReviewMember.new
  end

  # GET /petition_review_members/1/edit
  def edit
  end

  # POST /petition_review_members
  # POST /petition_review_members.json
  def create
    @petition_review_member = PetitionReviewMember.new(petition_review_member_params)

    respond_to do |format|
      if @petition_review_member.save
        format.html { redirect_to petition_review_members_path, notice: 'Petition review member was successfully created.' }
        format.json { render :show, status: :created, location: @petition_review_member }
      else
        format.html { render :new }
        format.json { render json: @petition_review_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /petition_review_members/1
  # PATCH/PUT /petition_review_members/1.json
  def update
    respond_to do |format|
      if @petition_review_member.update(petition_review_member_params)
        format.html { redirect_to petition_review_members_path, notice: 'Petition review member was successfully updated.' }
        format.json { render :show, status: :ok, location: @petition_review_member }
      else
        format.html { render :edit }
        format.json { render json: @petition_review_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /petition_review_members/1
  # DELETE /petition_review_members/1.json
  def destroy
    @petition_review_member.destroy
    respond_to do |format|
      format.html { redirect_to petition_review_members_url, notice: 'Petition review member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_petition_review_member
      @petition_review_member = PetitionReviewMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def petition_review_member_params
      params.require(:petition_review_member).permit(:organization_unit_id, :name, :profession, :phone, :email, :photo)
    end
end
