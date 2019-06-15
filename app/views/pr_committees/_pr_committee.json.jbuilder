json.extract! pr_committee, :id, :petition_id, :name, :deadline, :created_at, :updated_at
json.url pr_committee_url(pr_committee, format: :json)
