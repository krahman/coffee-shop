class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :qty
      t.references :menu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
