class CreateCrCommitteeMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :cr_committee_members do |t|
      t.references :user, foreign_key: true
      t.references :organization_unit, foreign_key: true
      t.references :cr_committee, foreign_key: true
      t.string :title
      t.string :full_name
      t.string :email
      t.string :phone
      t.text :about_me

      t.timestamps
    end
  end
end
