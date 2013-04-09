class Sale < ActiveRecord::Base
	has_many :sale_products
	accepts_nested_attributes_for :sale_products, :allow_destroy => true
	attr_accessible :address,
									:city,
									:state,
									:country,
									:email,
									:gateway,
									:name,
									:order_date,
									:slug,
									:total_amount,
									:order_status,
									:transaction_id,
									:user_id,
									:sale_products_attributes
	before_create :order_date
	validates_presence_of :name,:email,:address,:state,:city,:country,:gateway,:total_amount,:transaction_id
	validates :total_amount,:numericality => true
	validates :email,:format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	
	def order_date
		self.order_date = Time.now
	end
end
