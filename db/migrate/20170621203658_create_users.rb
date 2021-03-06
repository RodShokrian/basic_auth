class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false, unique: true
      t.string :password_digest, null: false
      t.string :session_token
      t.timestamps null: false
    end
    add_index :users, [:user_name, :session_token], unique: true
  end
end
