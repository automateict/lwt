class CrCommitteeMembersController < ApplicationController
  before_action :set_cr_committee_member, only: [:show, :edit, :update, :destroy]

  # GET /cr_committee_members
  # GET /cr_committee_members.json
  def index
    @cr_committee_members = CrCommitteeMember.all
  end

  # GET /cr_committee_members/1
  # GET /cr_committee_members/1.json
  def show
  end

  # GET /cr_committee_members/new
  def new
    @cr_committee_member = CrCommitteeMember.new
  end

  # GET /cr_committee_members/1/edit
  def edit
  end

  # POST /cr_committee_members
  # POST /cr_committee_members.json
  def create
    @cr_committee_member = CrCommitteeMember.new(cr_committee_member_params)

    respond_to do |format|
      if @cr_committee_member.save
        format.html { redirect_to @cr_committee_member, notice: 'Cr committee member was successfully created.' }
        format.json { render :show, status: :created, location: @cr_committee_member }
      else
        format.html { render :new }
        format.json { render json: @cr_committee_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cr_committee_members/1
  # PATCH/PUT /cr_committee_members/1.json
  def update
    respond_to do |format|
      if @cr_committee_member.update(cr_committee_member_params)
        format.html { redirect_to @cr_committee_member, notice: 'Cr committee member was successfully updated.' }
        format.json { render :show, status: :ok, location: @cr_committee_member }
      else
        format.html { render :edit }
        format.json { render json: @cr_committee_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cr_committee_members/1
  # DELETE /cr_committee_members/1.json
  def destroy
    @cr_committee_member.destroy
    respond_to do |format|
      format.html { redirect_to cr_committee_members_url, notice: 'Cr committee member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cr_committee_member
      @cr_committee_member = CrCommitteeMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cr_committee_member_params
      params.require(:cr_committee_member).permit(:organization_unit_id, :cr_committee_id, :title, :full_name, :email, :phone, :about_me)
    end
end
