class CreatePrCommittees < ActiveRecord::Migration[5.1]
  def change
    create_table :pr_committees do |t|
      t.references :government_body, foreign_key: true
      t.references :sector, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
