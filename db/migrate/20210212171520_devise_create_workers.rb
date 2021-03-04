class DeviseCreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|
      t.string :name,               null: true,  default: ""
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean :is_manager, default: false
      t.timestamps null: false
    end

    add_index :workers, :email,                unique: true
    add_index :workers, :reset_password_token, unique: true
  end
end
