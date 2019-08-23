class User < ApplicationRecord
  belongs_to :organization_unit, optional: true
  has_many :petitions
  has_one :person
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = [ADMIN='Admin', USER='User', COMMITEE='Committee']
  accepts_nested_attributes_for :person

  def load_petitions
    petitions = []
    unless organization_unit.blank?
      petitions = Petition.where('organization_unit_id = ?', organization_unit_id)
    else
      petitions = self.petitions
    end
    return petitions
  end

  def signed(petition)
    !petition.signatures.where('user_id = ?', id).blank?
  end
  def has_role(role_name)
    role == role_name rescue nil
  end

  def admin?
    role == 'Admin' rescue nil
  end

  def parent_org_unit
    !institution.blank? ? OrganizationUnit.top_organization_unit : organization_unit
  end

  def self.load_users(user)
    users = []
    if user and user.organization_unit
      users = user.organization_unit.sub_users
    end
    return users
  end

  def to_s
    person
  end

end
