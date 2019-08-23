class CreateCrCommittees < ActiveRecord::Migration[5.2]
  def change
    create_table :cr_committees do |t|
      t.references :complaint, foreign_key: true
      t.date :deadline

      t.timestamps
    end
  end
end
