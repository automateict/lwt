class PetitionReviewMember < ApplicationRecord
  belongs_to :organization_unit, optional: true

  has_one_attached :photo

  def to_s
    name
  end
end
