class ChangeColumnname < ActiveRecord::Migration[7.0]
  def change
    rename_column :flowers, :sale_praice, :sale_price
  end
end
