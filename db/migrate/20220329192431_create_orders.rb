class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :subtotal
      t.decimal :pst
      t.decimal :gst
      t.decimal :hst
      t.decimal :total
      t.datetime :purchase_date
      t.string :status

      t.timestamps
    end
  end
end
