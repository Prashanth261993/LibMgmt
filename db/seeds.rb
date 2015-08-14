# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	Book.create(title: 'book1', author: 'author1', price: '10', user_id: '2')
	Book.create(title: 'book2', author: 'author2', price: '10')
	Book.create(title: 'book3', author: 'author3', price: '10', user_id: '2')
	Book.create(title: 'book4', author: 'author2', price: '10', user_id: '2')
	Book.create(title: 'book5', author: 'author4', price: '10')
	User.create(usermail: 'admin@gmail.com', password: '1234567',usertype: '1')
	