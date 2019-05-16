json.extract! complaint, :id, :user_id, :organization_unit_id, :title, :body, :status, :created_at, :updated_at
json.url complaint_url(complaint, format: :json)
