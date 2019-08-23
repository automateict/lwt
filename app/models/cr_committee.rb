class CrCommittee < ApplicationRecord
  belongs_to :complaint
  has_many :cr_committee_members

  accepts_nested_attributes_for :cr_committee_members, allow_destroy: true
end
