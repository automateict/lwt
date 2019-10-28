class CreatePetitionReports < ActiveRecord::Migration[5.2]
  def change
    create_table :petition_reports, id: :uuid do |t|
      t.string :title
      t.references :petition, type: :uuid, foreign_key: true
      t.references :pr_committee, type: :uuid, foreign_key: true
      t.string :decision_made
      t.date :report_date
      t.text :remark

      t.timestamps
    end
  end
end
