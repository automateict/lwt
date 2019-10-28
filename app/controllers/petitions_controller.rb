class PetitionsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_petition, only: [:show, :edit, :update, :destroy, :sign, :add_comment, :publish, :reject]
  before_action :load_org_units, only: [:new, :create, :edit, :update]

  def load_org_units
    @org_units = OrganizationUnit.petition_org_units
  end
  # GET /petitions
  # GET /petitions.json
  def index
    @type = params['type']
    @petitions = @type.blank? ? Petition.all : Petition.where(status: @type)
  end

  def load_petitions
    @organization_unit  = OrganizationUnit.find(params[:node])
    @petitions = @organization_unit.sub_petitions
    render partial: 'petitions'
  end

  def publish
    @petition.update_attribute('status', Constants::ACTIVE)
    redirect_to @petition
  end

  def reject
    @petition.update_attribute('status', Constants::REJECTED)
    redirect_to @petition
  end

  def add_comment
    @petition.update(petition_params)
    flash[:notice] = 'Comment added successfully'
    redirect_to @petition
  end

  def sign
    signature = @petition.signatures.build(user_id: current_user.id)
    signature.save
    redirect_to @petition
  end

  def petitions_by_status
    petitions = Petition.all_petitions(current_user).group('status').count
    render json: petitions
  end

  def petitions_by_org_unit_by_status
    petitions = []
    Constants::PETITTION_STATUSES.each do |c|
      petitions << {name: c, data: (current_user.organization_unit.sub_units << current_user.organization_unit).map{|ou| [ou.to_s, Petition.org_unit_petitions_by_status(current_user, ou, c).count]} }
    end
    render json: petitions
  end

  def petitions_by_sector_by_status
    petitions = []
    Constants::PETITTION_STATUSES.each do |c|
      petitions << {name: c, data: Sector.all.map{|sec| [sec.to_s, Petition.petitions_by_sector_and_status(current_user, sec, c).count]} }
    end
    render json: petitions
  end

  # GET /petitions/1
  # GET /petitions/1.json
  def show
    @comment = @petition.comments.build
    if current_user
    unless @petition.read(current_user.id)
      puv = @petition.petition_user_visits.build(user_id: current_user.id)
      puv.save
    end
    end
  end

  # GET /petitions/new
  def new
    @petition = Petition.new
  end

  # GET /petitions/1/edit
  def edit
  end

  # POST /petitions
  # POST /petitions.json
  def create
    @petition = Petition.new(petition_params)
    @petition.status = Constants::PENDING
    respond_to do |format|
      if @petition.save
        format.html { redirect_to @petition, notice: 'Petition was successfully created.' }
        format.json { render :show, status: :created, location: @petition }
      else
        format.html { render :new }
        format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /petitions/1
  # PATCH/PUT /petitions/1.json
  def update
    respond_to do |format|
      if @petition.update(petition_params)
        format.html { redirect_to @petition, notice: 'Petition was successfully updated.' }
        format.json { render :show, status: :ok, location: @petition }
      else
        format.html { render :edit }
        format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /petitions/1
  # DELETE /petitions/1.json
  def destroy
    @petition.destroy
    respond_to do |format|
      format.html { redirect_to petitions_url, notice: 'Petition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_petition
      @petition = Petition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def petition_params
      params.require(:petition).permit(:user_id, :organization_unit_id, :sector_id, :title, :petition_details, :target_of_signatures,
                                       :need_for_email_notification, :status, :cover_image, documents_attributes: [:id, :name, :attachment, :_destroy],
                                       comments_attributes: [:id, :user_id, :commentable_type, :commentable_id, :content, :updated_at])
    end
end
