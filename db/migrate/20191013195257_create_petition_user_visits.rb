class CreatePetitionUserVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :petition_user_visits, id: :uuid do |t|
      t.references :petition, type: :uuid, foreign_key: true
      t.references :user, type: :uuid, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
