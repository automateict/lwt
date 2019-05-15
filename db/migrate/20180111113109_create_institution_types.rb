class CreateInstitutionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :institution_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
