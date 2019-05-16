class CreateComplaints < ActiveRecord::Migration[5.2]
  def change
    create_table :complaints do |t|
      t.references :user, foreign_key: true
      t.references :organization_unit, foreign_key: true
      t.string :title
      t.text :body
      t.string :status

      t.timestamps
    end
  end
end
