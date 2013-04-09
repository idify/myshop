class Product < ActiveRecord::Base
  attr_accessible :available_stock, :name, :price
	extend FriendlyId
  friendly_id :name, use: :slugged
	validates_presence_of :name,:price
	has_many :sale_products
	validates :price,:numericality => true
	validates :available_stock,:numericality => {:only_integer=>true}
end
