json.extract! petition_report, :id, :title, :petition_id, :pr_committee_id, :decision_made, :report_date, :remark, :created_at, :updated_at
json.url petition_report_url(petition_report, format: :json)
