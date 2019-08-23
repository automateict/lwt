class PetitionSupportingDocument < ApplicationRecord
  belongs_to :petition

  has_one_attached :document
end
