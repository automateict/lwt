class CrCommitteeMember < ApplicationRecord
  belongs_to :user
  belongs_to :cr_committee

  validates :user_id, :role, presence: true

end
