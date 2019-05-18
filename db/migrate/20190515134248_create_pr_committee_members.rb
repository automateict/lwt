class CreatePrCommitteeMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :pr_committee_members do |t|
      t.references :user, foreign_key: true
      t.references :pr_committee, foreign_key: true
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :profession
      t.string :organization
      t.text :about_the_member

      t.timestamps
    end
  end
end
