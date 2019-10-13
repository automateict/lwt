class AddAcceptComplaintToOrganizationUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :organization_units, :accept_complaint, :boolean
  end
end
