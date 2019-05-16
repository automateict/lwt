json.extract! sign_petition, :id, :petition_id, :full_name, :email, :remark, :created_at, :updated_at
json.url sign_petition_url(sign_petition, format: :json)
