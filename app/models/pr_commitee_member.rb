class PrCommiteeMember < ApplicationRecord
  belongs_to :pr_committee
  belongs_to :organization_unit
end
