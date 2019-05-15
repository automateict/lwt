class Petition < ApplicationRecord
  belongs_to :government_body_type
  belongs_to :government_body
  belongs_to :sector
end
