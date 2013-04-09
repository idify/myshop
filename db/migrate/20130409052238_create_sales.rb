class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.datetime :order_date
      t.float  :total_amount
      t.string :gateway
      t.string :transaction_id
      t.string :name
      t.string :email
      t.string :address
			t.string :state
			t.string :city
			t.string :country
      t.string :slug
      t.timestamps
    end
		add_index :sales, :slug, unique: true
  end
end
