class CreateComplaintClientSatisfactions < ActiveRecord::Migration[5.2]
  def change
    create_table :complaint_client_satisfactions do |t|
      t.references :complaint, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :rating
      t.text :feedback

      t.timestamps
    end
  end
end
