puts "\nGet a random Product"
p Product.all.sample
puts "\nSelect the order of an order line"
p OrderLine.first.order
puts "\nSelect All orders that contains an X product"
p Product.first.orders
puts "\nSelect the total of sales of X product"
p Product.first.order_lines.to_a.reduce(0) { |sales, order_line| sales + order_line.total }.to_f
puts "\nSelect All the customers who bought a product with price greater than $60, sorted by product name (include customer, product and order information)"
p Product.select('customers.*,products.*,products.name as product_name,orders.*').joins(:customers).where('order_lines.price > 60').order(:product_name)
puts "\nSelect All orders between dates X and Y"
p Order.where(date: '2022-06-08'..'2022-12-25')
puts "\nCount the total of customer who buy a product, with the amount of product ordered desc by total customer,"
p Product.select('products.id,products.name,COUNT(customers.*) AS total_customers ').joins(:customers).group('products.id').order(total_customers: :desc)
puts "\nSelect All the products a X Customer has bought ordered by date"
p Customer.first.products.order('orders.date')
puts "\nSelect the total amount of products a X customer bought between 2 dates"
p Customer.first.order_lines.where(orders: { date: '2022-01-08'..'2022-06-08' }).sum('order_lines.quantity')
puts "\nSelect the id of the 3 customer that has expend more"
p Customer.select(:id).joins(:orders).group('customers.id').order('sum(orders.total) desc').limit(3)
puts "\nSelect what is the most purchased product"
p Product.joins(:order_lines).group(:id).order('sum(order_lines.quantity) desc').limit(1)
puts "\nUpdate products stock to 10 when stock is smaller than 3"
Product.where('stock < 3').update(stock: 10)
