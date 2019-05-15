class CreateGovernmentBodies < ActiveRecord::Migration[5.1]
  def change
    create_table :government_bodies do |t|
      t.references :government_body_type, foreign_key: true
      t.string :name
      t.references :region, foreign_key: true
      t.string :city
      t.string :url
      t.string :email
      t.string :phone
      t.text :description

      t.timestamps
    end
  end
end
