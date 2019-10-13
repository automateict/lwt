class Signature < ApplicationRecord
  belongs_to :user
  belongs_to :petition

  validates :user_id, uniqueness: {scope: :petition_id}

end
