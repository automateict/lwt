class Complaint < ApplicationRecord
  belongs_to :user
  belongs_to :organization_unit
end