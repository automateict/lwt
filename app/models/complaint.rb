class Complaint < ApplicationRecord
  belongs_to :user
  belongs_to :organization_unit
  has_one :cr_committee
  has_many :documents, as: :documentable
  has_many :comments, as: :commentable
  has_many :complaint_reports

  accepts_nested_attributes_for :documents, allow_destroy: true

  scope :all_complaints, -> (user){ user.load_complaints }
  scope :org_unit_complaints_by_status, -> (user, org_unit, status){ all_complaints(user).where('organization_unit_id in (?) and status = ?',
                                                                                               org_unit.sub_units.pluck(:id) << org_unit.id, status) }
  scope :pending_complaints, -> (user){ all_complaints(user).where('status = ?', Constants::PENDING ) }
  scope :under_review_complaints, -> (user){ all_complaints(user).where('status = ?', Constants::UNDER_REVIEW ) }
  scope :resolved_complaints, -> (user){ all_complaints(user).where('status = ?', Constants::RESOLVED ) }

end
