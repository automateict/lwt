class PrCommitteeMembersController < ApplicationController
  before_action :set_pr_committee_member, only: [:show, :edit, :update, :destroy]

  # GET /pr_committee_members
  # GET /pr_committee_members.json
  def index
    @pr_committee_members = PrCommitteeMember.all
  end

  # GET /pr_committee_members/1
  # GET /pr_committee_members/1.json
  def show
  end

  # GET /pr_committee_members/new
  def new
    @pr_committee_member = PrCommitteeMember.new
  end

  # GET /pr_committee_members/1/edit
  def edit
  end

  # POST /pr_committee_members
  # POST /pr_committee_members.json
  def create
    @pr_committee_member = PrCommitteeMember.new(pr_committee_member_params)

    respond_to do |format|
      if @pr_committee_member.save
        format.html { redirect_to @pr_committee_member, notice: 'Pr committee member was successfully created.' }
        format.json { render :show, status: :created, location: @pr_committee_member }
      else
        format.html { render :new }
        format.json { render json: @pr_committee_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pr_committee_members/1
  # PATCH/PUT /pr_committee_members/1.json
  def update
    respond_to do |format|
      if @pr_committee_member.update(pr_committee_member_params)
        format.html { redirect_to @pr_committee_member, notice: 'Pr committee member was successfully updated.' }
        format.json { render :show, status: :ok, location: @pr_committee_member }
      else
        format.html { render :edit }
        format.json { render json: @pr_committee_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pr_committee_members/1
  # DELETE /pr_committee_members/1.json
  def destroy
    @pr_committee_member.destroy
    respond_to do |format|
      format.html { redirect_to pr_committee_members_url, notice: 'Pr committee member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pr_committee_member
      @pr_committee_member = PrCommitteeMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pr_committee_member_params
      params.require(:pr_committee_member).permit(:pr_committee_id, :title, :first_name, :last_name, :email, :phone, :profession, :organization, :about_the_member)
    end
end
