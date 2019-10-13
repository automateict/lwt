class PrCommitteesController < ApplicationController
  before_action :set_pr_committee, only: [:show, :edit, :update, :destroy]
  before_action :load, only: [:new, :create, :edit, :update]

  def load
    @organization_members = User.where(organization_unit_id: current_user.organization_unit_id, role: User::COMMITEE)
  end
  # GET /pr_committees
  # GET /pr_committees.json
  def index
    @pr_committees = PrCommittee.all
  end

  # GET /pr_committees/1
  # GET /pr_committees/1.json
  def show
  end

  # GET /pr_committees/new
  def new
    @pr_committee = PrCommittee.new
    @pr_committee.petition_id = params[:petition]
  end

  # GET /pr_committees/1/edit
  def edit
  end

  # POST /pr_committees
  # POST /pr_committees.json
  def create
    @pr_committee = PrCommittee.new(pr_committee_params)
    respond_to do |format|
      if @pr_committee.save
        format.html { redirect_to @pr_committee.petition, notice: 'Petition Review committee was successfully created.' }
        format.json { render :show, status: :created, location: @pr_committee }
      else
        format.html { render :new }
        format.json { render json: @pr_committee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pr_committees/1
  # PATCH/PUT /pr_committees/1.json
  def update
    respond_to do |format|
      if @pr_committee.update(pr_committee_params)
        format.html { redirect_to @pr_committee.petition, notice: 'Petition Review committee was successfully updated.' }
        format.json { render :show, status: :ok, location: @pr_committee }
      else
        format.html { render :edit }
        format.json { render json: @pr_committee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pr_committees/1
  # DELETE /pr_committees/1.json
  def destroy
    @pr_committee.destroy
    respond_to do |format|
      format.html { redirect_to pr_committees_url, notice: 'Petition Review committee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pr_committee
      @pr_committee = PrCommittee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pr_committee_params
      params.require(:pr_committee).permit(:petition_id, :name, :deadline, pr_commitee_members_attributes: [:id, :user_id, :role, :_destroy])
    end
end
