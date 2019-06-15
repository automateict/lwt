class CreateGovernmentBodyTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :government_body_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
