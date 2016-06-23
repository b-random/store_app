# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.create(:name => "Weird Beard", :description => "Rub in, dry conditioning shampoo.  No rinse needed", :price => "$16.97")
Product.create(:name => "Bob's Barber Shop", :description => "All Natural Essential Oils: Citrus", :price => "$11.97")
Product.create(:name => "Bob's Barber Shop", :description => "All Natural Essential Oils: Tea Tree", :price => "$11.97")
Product.create(:name => "Bob's Barber Shop", :description => "All Natural Essential Oils: Unscented", :price => "$11.97")