class CreatePetitionClientSatisfactions < ActiveRecord::Migration[5.2]
  def change
    create_table :petition_client_satisfactions, id: :uuid do |t|
      t.references :petition, type: :uuid, foreign_key: true
      t.integer :rating
      t.text :feedback

      t.timestamps
    end
  end
end
