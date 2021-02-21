class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.string :code, null: true, default: ""
      t.string :shipment_definition, null: false, default: ""
      t.string :shipment_object_description, null: false, default: ""
      t.string :about_payment, null: false, default: ""
      t.string :note, null: true, default: ""
      t.datetime :delivery_date, null: false
      t.string :phone, null: false, default: ""
      t.string :customer_phone, null: true, default: ""
      t.string :recipient_phone, null: true, default: ""
      t.string :email, null: true,  default: ""
      t.string :customer_name, null: true, default: ""
      t.string :recipient_name, null: true, default: ""
      t.string :location_from, null: true, default: ""
      t.string :location_to, null: true, default: ""
      t.integer :status, null: false, default: 0, comment: "0->burgtesen, 1->zamd ywaa, 2->tulbur tologdson, 3->duussan"
      t.string :status_history, null: true, default: "", comment: "burgtesen, zamd ywaa, tulbur tologdson, duussan"
      t.datetime :delivered_date, null: true, default: nil
      t.decimal :price, null: false, default: 0
      t.bigint :created_worker_id, null: false
      t.bigint :updated_worker_id, null: false
      t.timestamps
    end
  end
end

