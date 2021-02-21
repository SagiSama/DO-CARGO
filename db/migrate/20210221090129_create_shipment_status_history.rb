class CreateShipmentStatusHistory < ActiveRecord::Migration[6.0]
  def change
    create_table :shipment_status_histories do |t|
      t.integer :shipment_id, null: false
      t.integer :status, null: false,  default: 0, comment: "0->burgtesen, 1->zamd ywaa, 2->tulbur tologdson, 3->hurgegdsen"
      t.bigint :created_worker_id,   null: false
      t.bigint :updated_worker_id,   null: false
      t.timestamps
    end
  end
end
