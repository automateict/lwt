class CreatePetitionUserVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :petition_user_visits do |t|
      t.references :petition, foreign_key: true
      t.references :user, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
