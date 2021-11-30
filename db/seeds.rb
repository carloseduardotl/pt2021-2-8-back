# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Tag.destroy_all
Tag.create(name: 'Cães', description: 'dicas de cuidado para seus cachorros')
Tag.create(name: 'Gatos', description: 'dicas de cuidado para seus gatinhos')
Tag.create(name: 'alimentação', description: 'alimentação de animais')

Post.destroy_all
Post.create!(name: 'teste post1', content: 'texto 1', views: 3)
Post.create!(name: 'teste post2', content: 'texto 2',views: 25)
Post.create!(name: 'teste post3', content: 'texto 3', views: 9)