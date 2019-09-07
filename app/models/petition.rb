class Petition < ApplicationRecord
  belongs_to :user
  belongs_to :organization_unit
  belongs_to :sector, optional: true
  has_many :signatures
  has_one :pr_committee
  has_many :documents, as: :documentable
  has_many :comments, as: :commentable
  has_many :petition_reports
  has_one_attached :cover_image

  accepts_nested_attributes_for :documents, allow_destroy: true
  accepts_nested_attributes_for :comments, allow_destroy: true

  scope :all_petitions, -> (user){ user.load_petitions }
  scope :org_unit_petitions_by_status, -> (user, org_unit, status){ all_petitions(user).where('organization_unit_id in (?) and status = ?',
                                                                                              org_unit.sub_units.pluck(:id) << org_unit.id, status) }
  scope :petitions_by_sector_and_status, -> (user, sector, status) { all_petitions(user).where('sector_id = ? and status = ?', sector, status) }
  scope :ongoing_petitions, -> (user) { all_petitions(user).where('target_of_signatures > ?', joins(:signatures).count) }
  scope :under_review_petitions, -> (user) { all_petitions(user).where('status = ?', Constants::UNDER_REVIEW)}
  scope :resolved_petitions, -> (user) { all_petitions(user).where('status = ?', Constants::RESOLVED)}

  def recent_signers
    signatures.order('created_at').limit(5)
  end

  def self.active_petitions(user)
    user.load_petitions.where('status')
  end

end
