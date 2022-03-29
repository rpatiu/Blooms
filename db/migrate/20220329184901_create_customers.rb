class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :password
      t.string :role
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
