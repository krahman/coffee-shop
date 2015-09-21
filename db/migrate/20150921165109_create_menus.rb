class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.decimal :price
      t.references :type, index: true, foreign_key: true
      t.references :size, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
