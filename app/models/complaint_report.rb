class ComplaintReport < ApplicationRecord
  belongs_to :complaint
  belongs_to :cr_committee, optional: true
  has_one_attached :document
end
