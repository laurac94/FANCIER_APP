class AddStateToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :state, :integer
  end
end
