class CrCommitteeMember < ApplicationRecord
  belongs_to :organization_unit
  belongs_to :cr_committee
end
