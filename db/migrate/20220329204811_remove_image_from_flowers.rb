class RemoveImageFromFlowers < ActiveRecord::Migration[7.0]
  def change
    remove_column :flowers, :image, :string
  end
end
