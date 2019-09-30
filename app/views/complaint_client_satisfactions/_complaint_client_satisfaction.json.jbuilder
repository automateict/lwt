json.extract! complaint_client_satisfaction, :id, :complaint_id, :user_id, :rating, :feedback, :created_at, :updated_at
json.url complaint_client_satisfaction_url(complaint_client_satisfaction, format: :json)
