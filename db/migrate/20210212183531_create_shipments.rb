class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.string :code, null: true, default: ""
      t.string :definition, null: false,  default: ""
      t.string :note, null: true,  default: ""
      t.datetime :delivery_date, null: false,  default: nil
      t.string :phone, null: false,  default: nil
      t.string :customer_name, null: true,  default: ""
      t.string :recipient_name, null: true,  default: ""

      t.bigint   :created_worker_id,   null: false
      t.bigint   :created_worker_id,   null: false
      t.timestamps
    end
  end
end
