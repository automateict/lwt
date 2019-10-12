class PrCommitteeMember < ApplicationRecord
  belongs_to :user
  belongs_to :pr_commitee
end
