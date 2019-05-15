json.extract! petition, :id, :government_body_type_id, :government_body_id, :sector_id, :title, :petition_details, :target_of_signatures, :need_for_email_notification, :status, :created_at, :updated_at
json.url petition_url(petition, format: :json)
