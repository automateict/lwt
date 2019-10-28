class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments, id: :uuid do |t|
      t.references :user, type: :uuid, foreign_key: true
      t.references :commentable, type: :uuid, polymorphic: true, index: true
      t.text :content
      t.boolean :status

      t.timestamps
    end
  end
end
