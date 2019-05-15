json.extract! government_body, :id, :government_body_type_id, :name, :region_id, :city, :url, :email, :phone, :description, :created_at, :updated_at
json.url government_body_url(government_body, format: :json)
