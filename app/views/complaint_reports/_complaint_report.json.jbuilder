json.extract! complaint_report, :id, :title, :complaint_id, :cr_committee_id, :decision, :report_date, :remark, :created_at, :updated_at
json.url complaint_report_url(complaint_report, format: :json)
