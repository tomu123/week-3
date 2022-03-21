# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do
  Customer.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.full_address,
                  phone: Faker::PhoneNumber.cell_phone_with_country_code)
end

20.times do
  Product.create(sku: Faker::Code.asin, name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, price: Faker::Commerce.price(range: 10..100).round(2),
                 stock: rand(30..100))
end

products = Product.all
customers = Customer.all
10.times do
  order = Order.create(date: Faker::Date.in_date_period, customer: customers.sample, order_status: %w[pending completed cancelled].sample)
  (1..rand(1..5)).each do
    product = products.sample
    product = products.sample until product.stock.positive?
    OrderLine.create(order: order, product: product, quantity: rand(1..product.stock), price: product.price)
  end
end
