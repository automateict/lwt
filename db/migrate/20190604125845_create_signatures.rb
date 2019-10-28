class CreateSignatures < ActiveRecord::Migration[5.2]
  def change
    create_table :signatures, id: :uuid do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.references :petition, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
