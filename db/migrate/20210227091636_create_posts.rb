class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, default: ""
      t.string :subject, default: ""
      t.text :note, default: ""
      t.boolean :status, default: false
    end
  end
end
