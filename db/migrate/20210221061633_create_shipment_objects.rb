class CreateShipmentObjects < ActiveRecord::Migration[6.0]
  def change
    create_table :shipment_objects do |t|
      t.integer :shipment_id, null: false
      t.string :name, null: false,  default: ""
      t.string :note, null: true,  default: ""
      t.integer :height, null: true, default: 0
      t.integer :width, null: true, default: 0
      t.integer :weight, null: true, default: 0
      t.integer :quantity, null: false,  default: 0
      t.timestamps
    end
  end
end
