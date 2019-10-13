class CreateComplaintUserVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :complaint_user_visits do |t|
      t.references :complaint, foreign_key: true
      t.references :user, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
