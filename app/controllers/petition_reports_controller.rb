class PetitionReportsController < ApplicationController
  before_action :set_petition_report, only: [:show, :edit, :update, :destroy]

  # GET /petition_reports
  # GET /petition_reports.json
  def index
    @petition_reports = PetitionReport.all
  end

  # GET /petition_reports/1
  # GET /petition_reports/1.json
  def show
  end

  # GET /petition_reports/new
  def new
    @petition_report = PetitionReport.new
  end

  # GET /petition_reports/1/edit
  def edit
  end

  # POST /petition_reports
  # POST /petition_reports.json
  def create
    @petition_report = PetitionReport.new(petition_report_params)

    respond_to do |format|
      if @petition_report.save
        format.html { redirect_to @petition_report, notice: 'Petition report was successfully created.' }
        format.json { render :show, status: :created, location: @petition_report }
      else
        format.html { render :new }
        format.json { render json: @petition_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /petition_reports/1
  # PATCH/PUT /petition_reports/1.json
  def update
    respond_to do |format|
      if @petition_report.update(petition_report_params)
        format.html { redirect_to @petition_report, notice: 'Petition report was successfully updated.' }
        format.json { render :show, status: :ok, location: @petition_report }
      else
        format.html { render :edit }
        format.json { render json: @petition_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /petition_reports/1
  # DELETE /petition_reports/1.json
  def destroy
    @petition_report.destroy
    respond_to do |format|
      format.html { redirect_to petition_reports_url, notice: 'Petition report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_petition_report
      @petition_report = PetitionReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def petition_report_params
      params.require(:petition_report).permit(:title, :petition_id, :pr_committee_id, :decision_made, :report_date, :remark)
    end
end
