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

  scope :list_by_org_unit, -> (org_unit, user) {org_unit.blank? ? [] : all_complaints(user).where('organization_unit_id in (?)', org_unit.sub_units.pluck(:id) << org_unit.id)}
  scope :list_by_status, -> (status, user) {all_complaints(user).where('status = ?', status)}
  scope :list_by_from, -> (from, user) {all_complaints(user).where('date(created_at) >= ?', from)}
  scope :list_by_to, -> (to, user) {all_complaints(user).where('date(created_at) <= ?', to)}

  def self.search(org_unit, status, from, to, user)
    complaints = []
    available_filters = {org_unit => list_by_org_unit(org_unit, user), status => list_by_status(status,user),
                         from => list_by_from(from, user), to => list_by_to(to, user)}.select{|k,v| !k.blank?}
    counter = 0
    available_filters.each do |k,v|
      complaints = counter == 0 ? v : complaints.merge(v)
      counter += 1
    end
    return complaints.uniq
  end


  def complaint_status
    complaint_reports ? complaint_reports.order(:created_at).last.decision : status
  end

end
