class Order < ActiveRecord::Base
	belongs_to :product
end
#because each order can only include one product