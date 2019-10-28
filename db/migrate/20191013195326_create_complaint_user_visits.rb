class CreateComplaintUserVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :complaint_user_visits, id: :uuid do |t|
      t.references :complaint, type: :uuid, foreign_key: true
      t.references :user, type: :uuid, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
