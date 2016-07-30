class Product < ActiveRecord::Base
  validates :name, presence: true
  #this sends an error if a name is NOT included when creating a new product, through the product _form

	has_many :orders
	has_many :comments

	def average_rating
		comments.average(:rating).to_f
	end
end
# each product can have many orders
