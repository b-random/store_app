class Product < ActiveRecord::Base
	has_many :orders
end
# each product can have many orders
