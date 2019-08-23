class Complaint < ApplicationRecord
  belongs_to :user
  belongs_to :organization_unit
  has_one :cr_committee
  has_many :documents, as: :documentable
  has_many :complaint_reports

  accepts_nested_attributes_for :documents, allow_destroy: true

end
