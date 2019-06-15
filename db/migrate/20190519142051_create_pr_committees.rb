class CreatePrCommittees < ActiveRecord::Migration[5.2]
  def change
    create_table :pr_committees do |t|
      t.references :petition, foreign_key: true
      t.string :name
      t.date :deadline

      t.timestamps
    end
  end
end
