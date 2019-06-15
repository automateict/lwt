class CreateSignatures < ActiveRecord::Migration[5.2]
  def change
    create_table :signatures do |t|
      t.references :user, foreign_key: true
      t.references :petition, foreign_key: true

      t.timestamps
    end
  end
end
