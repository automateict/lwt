class PetitionReport < ApplicationRecord
  belongs_to :petition
  belongs_to :pr_committee
end
