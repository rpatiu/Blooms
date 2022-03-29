class CreateFlowers < ActiveRecord::Migration[7.0]
  def change
    create_table :flowers do |t|
      t.string :name
      t.text :description
      t.string :image
      t.decimal :price
      t.decimal :sale_praice

      t.timestamps
    end
  end
end
