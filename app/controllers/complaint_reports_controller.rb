class ComplaintReportsController < ApplicationController
  before_action :set_complaint_report, only: [:show, :edit, :update, :destroy]

  # GET /complaint_reports
  # GET /complaint_reports.json
  def index
    @complaint_reports = ComplaintReport.all
  end

  # GET /complaint_reports/1
  # GET /complaint_reports/1.json
  def show
  end

  # GET /complaint_reports/new
  def new
    @complaint_report = ComplaintReport.new
    @complaint_report.complaint_id = params[:complaint]
  end

  # GET /complaint_reports/1/edit
  def edit
  end

  # POST /complaint_reports
  # POST /complaint_reports.json
  def create
    @complaint_report = ComplaintReport.new(complaint_report_params)
    complaint = @complaint_report.complaint
    respond_to do |format|
      if @complaint_report.save
        complaint.update_attribute('status', @complaint_report.decision)
        format.html { redirect_to @complaint_report.complaint, notice: 'Complaint report was successfully created.' }
        format.json { render :show, status: :created, location: @complaint_report }
      else
        format.html { render :new }
        format.json { render json: @complaint_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /complaint_reports/1
  # PATCH/PUT /complaint_reports/1.json
  def update
    complaint = @complaint_report.complaint
    respond_to do |format|
      if @complaint_report.update(complaint_report_params)
        complaint.update_attribute('status', @complaint_report.decision)
        format.html { redirect_to @complaint_report.complaint, notice: 'Complaint report was successfully updated.' }
        format.json { render :show, status: :ok, location: @complaint_report }
      else
        format.html { render :edit }
        format.json { render json: @complaint_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complaint_reports/1
  # DELETE /complaint_reports/1.json
  def destroy
    @complaint_report.destroy
    respond_to do |format|
      format.html { redirect_to complaint_reports_url, notice: 'Complaint report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complaint_report
      @complaint_report = ComplaintReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_report_params
      params.require(:complaint_report).permit(:title, :complaint_id, :cr_committee_id, :decision, :report_date, :remark, :document)
    end
end
