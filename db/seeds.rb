# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# Category creation
science = Category.create(name: 'Science')
horror = Category.create(name: 'Horror')
gothic = Category.create(name: 'Gothic')
psychological = Category.create(name: 'Psychological')
biographical = Category.create(name: 'Biographical')

# Products creation
dra = Product.new(name: 'Dracula', 
description: 'Dracula PDF edition and 
other Bram Stoker books available', price: 30, stock: 200)
dra.category = science
dra.save
jane = Product.new(name: 'Jane Eyre',
description: 'Jane Eyre PDF edition and
 other Charlotte Bronte books available', price: 20.95, stock: 200)
jane.category = gothic
jane.save
frank = Product.new(name: 'Frankenstein',
description: 'Frankenstein PDF edition and 
other Mary Wollstonecraft Shelley books available ', price: 34, stock: 200)
frank.category = horror
frank.save
room = Product.new(name: 'A Room with a View',
description: 'A Room with a View PDF edition and 
other E. M. Forster books available', price: 40.95, stock: 200)
room.category = psychological
room.save
bio = Product.new(name: 'Biographical Stories',
description: 'Biographical Stories PDF edition and
 other Nathaniel Hawthorne books available', price: 20, stock: 200)
bio.category = biographical
bio.save
puts 'CREATED Categories and Products'

# Order Statuses creation
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Placed"
OrderStatus.create! id: 3, name: "Shipped"
OrderStatus.create! id: 4, name: "Cancelled"

puts 'CREATED - Order Statuses'