class GovernmentBody < ApplicationRecord
  belongs_to :government_body_type
  belongs_to :region
end
