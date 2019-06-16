class CreatePetitionReviewMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :petition_review_members do |t|
      t.references :government_body, foreign_key: true
      t.string :name
      t.string :profession
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
