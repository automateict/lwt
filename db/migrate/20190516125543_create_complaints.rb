class CreateComplaints < ActiveRecord::Migration[5.2]
  def change
    create_table :complaints, id: :uuid do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.references :organization_unit, type: :uuid, foreign_key: true
      t.string :title
      t.text :body
      t.string :status

      t.timestamps
    end
  end
end
