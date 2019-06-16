class PrCommittee < ApplicationRecord
  belongs_to :petition
  has_many :pr_commitee_members

  accepts_nested_attributes_for :pr_commitee_members, allow_destroy: true
end
