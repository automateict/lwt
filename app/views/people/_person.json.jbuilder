json.extract! person, :id, :user_id, :organization_unit_id, :first_name, :father_name, :grand_father_name, :profession, :phone, :created_at, :updated_at
json.url person_url(person, format: :json)
