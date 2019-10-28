class CreatePetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :petitions, id: :uuid do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.references :organization_unit, type: :uuid, foreign_key: true
      t.references :sector, type: :uuid, foreign_key: true
      t.string :title
      t.text :petition_details
      t.integer :target_of_signatures
      t.boolean :need_for_email_notification
      t.string :status

      t.timestamps
    end
  end
end
