class PetitionUserVisit < ApplicationRecord
  belongs_to :petition
  belongs_to :user
end
