class ReportsController < ApplicationController
  def petitions
    @petitions = []
    if request.post?
      org_unit = OrganizationUnit.find_by(id: params[:report][:organization_unit])
        @petitions = Petition.search(org_unit, params[:report][:sector],
                                     params[:report][:status], params[:report][:from],
                                     params[:report][:to], current_user)
        respond_to do |format|
          format.js
          format.html
        end
    end
  end

  def complaints
    @complaints = []
    if request.post?
      org_unit = OrganizationUnit.find_by(id: params[:report][:organization_unit])
      @complaints = Complaint.search(org_unit, params[:report][:status],
                                     params[:report][:from], params[:report][:to], current_user)
      respond_to do |format|
        format.js
        format.html
      end
    end
  end
end
