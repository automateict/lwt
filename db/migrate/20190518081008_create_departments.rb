class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.references :organization_unit, foreign_key: true
      t.string :name
      t.string :phone
      t.string :email
      t.text :description

      t.timestamps
    end
  end
end
