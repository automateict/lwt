class CreateCrCommittees < ActiveRecord::Migration[5.2]
  def change
    create_table :cr_committees do |t|
      t.references :organization_unit, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
