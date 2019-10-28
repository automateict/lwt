class CreateComplaintReports < ActiveRecord::Migration[5.2]
  def change
    create_table :complaint_reports, id: :uuid do |t|
      t.string :title
      t.references :complaint, type: :uuid, foreign_key: true
      t.references :cr_committee, type: :uuid, foreign_key: true
      t.string :decision
      t.date :report_date
      t.text :remark

      t.timestamps
    end
  end
end
