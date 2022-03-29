class DropAboutsAndContacts < ActiveRecord::Migration[7.0]
  def change
    drop_table :abouts
    drop_table :contacts
  end
end
