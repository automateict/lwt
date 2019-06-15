class GovernmentBody < ApplicationRecord
  belongs_to :government_body_type
  belongs_to :parent_government_body, optional: true, :class_name => 'GovernmentBody', :foreign_key => "parent_government_body_id"
  has_many :sub_government_bodies, :class_name => 'GovernmentBody', :foreign_key => "parent_government_body_id"
  has_many :petitions

  def to_s
    name
  end

end
