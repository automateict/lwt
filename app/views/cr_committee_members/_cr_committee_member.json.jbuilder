json.extract! cr_committee_member, :id, :organization_unit_id, :cr_committee_id, :title, :full_name, :email, :phone, :about_me, :created_at, :updated_at
json.url cr_committee_member_url(cr_committee_member, format: :json)
