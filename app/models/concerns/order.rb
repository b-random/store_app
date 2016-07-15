class Order < ActiveRecord::Base
	belongs_to :product
	belongs_to :user
end
#because each order can only include one product