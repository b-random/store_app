class Product < ActiveRecord::Base
	has_many :orders
	has_many :comments
end
# each product can have many orders
