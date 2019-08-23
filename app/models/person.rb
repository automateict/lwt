class Person < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :organization_unit, optional: true

  has_one_attached :photo

  def full_name
    [first_name, father_name, grand_father_name].join(' ')
  end

  def to_s
    full_name
  end
end
