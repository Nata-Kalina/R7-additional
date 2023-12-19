class AddOrderToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :customer_id, :string
    add_column :customers, :integer, :string
  end
end
