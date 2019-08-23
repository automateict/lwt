class CrCommitteeMember < ApplicationRecord
  belongs_to :person
  belongs_to :cr_committee
end
