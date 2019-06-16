class CreatePrCommiteeMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :pr_commitee_members do |t|
      t.references :pr_committee, foreign_key: true
      t.references :petition_review_member, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
