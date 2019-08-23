class Petition < ApplicationRecord
  belongs_to :user
  belongs_to :organization_unit
  belongs_to :sector, optional: true
  has_many :signatures
  has_one :pr_committee
  has_many :documents, as: :documentable
  has_many :petition_reports
  has_one_attached :cover_image

  accepts_nested_attributes_for :documents, allow_destroy: true

  scope :ongoing_petitions, -> {where('target_of_signatures > ?', joins(:signatures).count) }

  def recent_signers
    signatures.order('created_at').limit(5)
  end

end
