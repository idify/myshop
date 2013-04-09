class SaleProduct < ActiveRecord::Base
attr_accessible :product_id,:sale_id,:qty,:price
belongs_to	:sale
belongs_to  :products
validates_presence_of :qty,:price,:product_id
validates :qty,:numericality => { :only_integer => true }
validates :price,:numericality => true
end
