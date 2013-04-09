class CreateSaleProducts < ActiveRecord::Migration
  def change
    create_table :sale_products do |t|
			t.references :product
			t.references :sale
			t.integer 	 :qty,:default=>1
			t.float			 :price,:default=>0
			t.timestamp
		end
  end
end
