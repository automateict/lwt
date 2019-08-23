class PetitionReport < ApplicationRecord
  belongs_to :petition
  belongs_to :pr_committee, optional: true

  has_one_attached :document

end
