# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create(name: 'john doe')
User2 = User.create(name: 'jane doe')

tour1 = Tour.create(tourName:'North American Tour', picture: 'https://picsum.photos/200/300', description: 'Visit New York, Philadelphia and Vermont', hotel:'Ritz continental', price: 3350.40)
tour2 = Tour.create(tourName:'south American Tour', picture: 'https://picsum.photos/200/300', description: 'Visit Florida,Georgia and Texas', hotel:'Marriot', price: 2350.40)
