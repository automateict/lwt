class Petition < ApplicationRecord
  belongs_to :user
  belongs_to :government_body
  belongs_to :sector
  has_many :signatures
  has_one :pr_committee

  has_one_attached :logo

end
