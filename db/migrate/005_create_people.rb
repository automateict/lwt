class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.references :user
      t.references :organization_unit, foreign_key: true
      t.string :title
      t.string :first_name
      t.string :father_name
      t.string :grand_father_name
      t.string :profession
      t.string :phone
      t.text :about

      t.timestamps
    end
  end
end
