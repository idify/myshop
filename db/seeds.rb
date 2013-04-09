# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.create(:name=>"Shirt",:available_stock=>20,:price=>200)
Product.create(:name=>"Book",:available_stock=>5,:price=>1299)
Product.create(:name=>"Wine",:available_stock=>10,:price=>2000)

