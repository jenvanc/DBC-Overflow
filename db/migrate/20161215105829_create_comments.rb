class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :user, null: false
      t.references :commentable, polymorphic: true

      t.timestamps(null: false)
    end
  end
end
