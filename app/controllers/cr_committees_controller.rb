class CrCommitteesController < ApplicationController
  before_action :set_cr_committee, only: [:show, :edit, :update, :destroy]
  before_action :load, only: [:new, :create, :edit, :update]

  def load
    @organization_members = User.where(organization_unit_id: current_user.organization_unit_id)
  end
  # GET /cr_committees
  # GET /cr_committees.json
  def index
    @cr_committees = CrCommittee.all
  end

  # GET /cr_committees/1
  # GET /cr_committees/1.json
  def show
  end

  # GET /cr_committees/new
  def new
    @cr_committee = CrCommittee.new
    @cr_committee.complaint_id = params[:complaint]
  end

  # GET /cr_committees/1/edit
  def edit
  end

  # POST /cr_committees
  # POST /cr_committees.json
  def create
    @cr_committee = CrCommittee.new(cr_committee_params)

    respond_to do |format|
      if @cr_committee.save
        format.html { redirect_to @cr_committee.complaint, notice: 'Complaint Review committee was successfully created.' }
        format.json { render :show, status: :created, location: @cr_committee }
      else
        logger.info("--------------______#{@cr_committee.errors.inspect}")
        format.html { render :new }
        format.json { render json: @cr_committee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cr_committees/1
  # PATCH/PUT /cr_committees/1.json
  def update
    respond_to do |format|
      if @cr_committee.update(cr_committee_params)
        format.html { redirect_to @cr_committee.complaint, notice: 'Complaint Review committee was successfully updated.' }
        format.json { render :show, status: :ok, location: @cr_committee }
      else
        format.html { render :edit }
        format.json { render json: @cr_committee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cr_committees/1
  # DELETE /cr_committees/1.json
  def destroy
    @cr_committee.destroy
    respond_to do |format|
      format.html { redirect_to cr_committees_url, notice: 'Complaint Review committee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cr_committee
      @cr_committee = CrCommittee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cr_committee_params
      params.require(:cr_committee).permit(:complaint_id, :deadline,
                                           cr_committee_members_attributes: [:id, :cr_committee_id, :user_id, :role, :_destroy]
      )
    end
end
