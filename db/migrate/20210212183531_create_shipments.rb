class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.string :code, null: true, default: ""
      t.decimal :weight, null: false
      t.integer :delivery_type, null: true, default: 0, comment: "0->land, 1->air"
      t.integer :shipment_type, null: true, default: 0, comment: "0->normal, 1->express"
      t.integer :location_to, null: true, default: 0, comment: "0->Mongolia, 1->Korea"
      t.integer :location_from, null: true, default: 0, comment: "0->Korea, 1->Mongolia"
      t.decimal :price, default: 0
      t.integer :status, null: false, default: 0, comment: "0->burgtesen, 1->zamd ywaa, 2->tulbur tologdson, 3->duussan"
      t.string :status_history, null: true, default: "", comment: "burgtesen, zamd ywaa, tulbur tologdson, duussan"
      t.integer :current_location, null: true, default: 0, comment: "korea aguulah, achigdsan, gaali deer buusan, mongolia aguulahad, hurgegdsen"

      t.string :shipment_definition, default: ""
      t.string :shipment_object_description, default: ""
      t.string :about_payment, default: ""
      t.string :note, null: true, default: ""
      t.datetime :delivery_date

      t.string :phone, null: false, default: ""
      t.string :email,  default: ""

      t.string :customer_name, null: true, default: ""
      t.string :customer_phone, null: true, default: ""
      t.string :customer_address, null: true, default: ""

      t.string :recipient_name, null: true, default: ""
      t.string :recipient_phone, null: true, default: ""
      t.string :recipient_address, null: true, default: ""

      t.bigint :created_worker_id, null: false
      t.bigint :updated_worker_id, null: false
      t.timestamps
    end
  end
end

