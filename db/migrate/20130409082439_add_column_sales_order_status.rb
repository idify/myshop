class AddColumnSalesOrderStatus < ActiveRecord::Migration
  def up
		add_column :sales,:order_status ,:string,:default=>"pending"
  end

  def down
		remove_column :sales,:order_status
  end
end
