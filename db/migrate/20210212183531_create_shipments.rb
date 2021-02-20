class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.string :code, null: true, default: ""
      t.string :name, null: true,  default: ""
      t.string :note, null: true,  default: ""
      t.datetime :delivery_date, null: false,  default: nil
    end
  end
end
