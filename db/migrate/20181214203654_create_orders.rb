class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :address, foreign_key: true
      t.integer :beacons, default: 0
      t.decimal :total_price, default: 0
      t.integer :status

      t.timestamps
    end
  end
end
