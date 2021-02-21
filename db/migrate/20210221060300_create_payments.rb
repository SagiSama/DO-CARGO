class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.bigint :shipment_id, null: false
      t.decimal :amount_paid, null: false
      t.integer :payment_type, null: true, default: 0, comment: "1->belen, 2->dans"
      t.string :note, null: true,  default: ""
      t.bigint :created_worker_id,   null: false
      t.bigint :updated_worker_id,   null: false
      t.timestamps
    end
  end
end
