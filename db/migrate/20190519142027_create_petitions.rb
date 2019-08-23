class CreatePetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :petitions do |t|
      t.references :user, foreign_key: true
      t.references :organization_unit, foreign_key: true
      t.references :sector, foreign_key: true
      t.string :title
      t.text :petition_details
      t.integer :target_of_signatures
      t.boolean :need_for_email_notification
      t.string :status

      t.timestamps
    end
  end
end
