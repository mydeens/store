# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

science = Category.create(name: 'Science')
horror = Category.create(name: 'Horror')
gothic = Category.create(name: 'Gothic')
psychological = Category.create(name: 'Psychological')
biographical = Category.create(name: 'Biographical')

dra = Product.new(name: 'Dracula', 
description: 'Dracula PDF edition and 
other Bram Stoker books available', price: 30)
dra.category = science
dra.save
jane = Product.new(name: 'Jane Eyre',
description: 'Jane Eyre PDF edition and
 other Charlotte Bronte books available', price: 20.95)
jane.category = gothic
jane.save
frank = Product.new(name: 'Frankenstein',
description: 'Frankenstein PDF edition and 
other Mary Wollstonecraft Shelley books available ', price: 34)
frank.category = horror
frank.save
room = Product.new(name: 'A Room with a View',
description: 'A Room with a View PDF edition and 
other E. M. Forster books available', price: 40.95)
room.category = psychological
room.save
bio = Product.new(name: 'Biographical Stories',
description: 'Biographical Stories PDF edition and
 other Nathaniel Hawthorne books available', price: 20)
bio.category = biographical
bio.save

puts 'CREATED Categories and Products'