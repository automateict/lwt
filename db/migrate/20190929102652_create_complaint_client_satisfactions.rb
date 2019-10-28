class CreateComplaintClientSatisfactions < ActiveRecord::Migration[5.2]
  def change
    create_table :complaint_client_satisfactions, id: :uuid do |t|
      t.references :complaint, type: :uuid, foreign_key: true
      t.integer :rating
      t.text :feedback

      t.timestamps
    end
  end
end
