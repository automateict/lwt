class CreateComplaintReports < ActiveRecord::Migration[5.2]
  def change
    create_table :complaint_reports do |t|
      t.string :title
      t.references :complaint, foreign_key: true
      t.references :cr_committee, foreign_key: true
      t.string :decision
      t.date :report_date
      t.text :remark

      t.timestamps
    end
  end
end
