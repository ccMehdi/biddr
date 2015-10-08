class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email_address
      t.string :password_digest

      t.timestamps null: false
    end
    add_index :users, :email_address, unique: true
  end
end
