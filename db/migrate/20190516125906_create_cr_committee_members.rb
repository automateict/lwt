class CreateCrCommitteeMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :cr_committee_members do |t|
      t.references :cr_committee, foreign_key: true
      t.references :user, foreign_key: true
      t.string :role


      t.timestamps
    end
  end
end
