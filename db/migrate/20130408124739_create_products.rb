class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name
      t.integer :available_stock
      t.float   :price
			t.string	:slug
      t.timestamps
    end
		add_index :products, :slug, unique: true
  end
end
