class CreateSignPetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :sign_petitions do |t|
      t.references :user, foreign_key: true
      t.references :petition, foreign_key: true
      t.string :full_name
      t.string :email
      t.text :remark

      t.timestamps
    end
  end
end
