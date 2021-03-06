class CreateOrganizationUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_units, id: :uuid do |t|
      t.string :name
      t.string :short_name
      t.string :code
      t.boolean :accept_petition
      t.references :organization_type, type: :uuid, foreign_key: true
      t.string :parent_organization_unit_id, type: :uuid
      t.string :url
      t.string :contact_person
      t.string :contact_phone
      t.string :contact_email
      t.float :latitude
      t.float :longitude
      t.text :description

      t.timestamps
    end
  end
end
