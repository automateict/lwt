json.extract! department, :id, :organization_unit_id, :name, :phone, :email, :description, :created_at, :updated_at
json.url department_url(department, format: :json)
