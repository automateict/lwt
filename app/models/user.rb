class User < ApplicationRecord
  belongs_to :government_body, optional: true
  belongs_to :role, optional: true
  belongs_to :institution, optional: true
  belongs_to :facility, optional: true
  has_many :petitions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def load_petitions
    petitions = []
    unless government_body.blank?
      petitions = Petition.where('government_body_id = ?', government_body_id)
    else
      petitions = self.petitions
    end
    return petitions
  end

  def signed(petition)
    !petition.signatures.where('user_id = ?', id).blank?
  end
  def has_role(role_name)
    role.name == role_name
  end

  def admin?
    role.name == 'Admin' rescue nil
  end

  def parent_org_unit
    !institution.blank? ? OrganizationUnit.top_organization_unit : organization_unit
  end

  def self.load_users(user,type)
    users = []
    if user.super_admin?
      users = User.where('user_type = ?', type)
    elsif user.institution
      users = User.where('institution_id = ?', user.institution_id)
    elsif user.facility
      users = User.where('facility_id = ?', user.facility_id)
    elsif user.organization_unit
      users = user.organization_unit.sub_users
    end
    return users
  end

  def to_s
    email
  end

end
