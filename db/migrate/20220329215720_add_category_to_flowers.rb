class AddCategoryToFlowers < ActiveRecord::Migration[7.0]
  def change
    add_reference :flowers, :category, null: false, foreign_key: true
  end
end
