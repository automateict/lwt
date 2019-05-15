json.extract! pr_committee_member, :id, :pr_committee_id, :title, :first_name, :last_name, :email, :phone, :profession, :organization, :about_the_member, :created_at, :updated_at
json.url pr_committee_member_url(pr_committee_member, format: :json)
