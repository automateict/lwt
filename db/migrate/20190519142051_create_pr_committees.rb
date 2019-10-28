class CreatePrCommittees < ActiveRecord::Migration[5.2]
  def change
    create_table :pr_committees, id: :uuid do |t|
      t.references :petition, type: :uuid, foreign_key: true
      t.date :deadline

      t.timestamps
    end
  end
end
