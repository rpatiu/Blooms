class AddFlowerToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :cart_items, :flower, null: false, foreign_key: true
  end
end
