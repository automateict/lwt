class CreatePrCommiteeMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :pr_commitee_members, id: :uuid do |t|
      t.references :pr_committee, type: :uuid, foreign_key: true
      t.references :user, type: :uuid, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
