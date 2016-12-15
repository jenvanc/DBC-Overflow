class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, unique: true, limit: 50, null: false
      t.string :email, unique: true, limit: 50, null: false
      t.string :password_digest, null: false

      t.timestamps(null: false)
    end
  end
end
