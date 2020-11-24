# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

User.destroy_all

puts "Creating users"
user = User.new(email: 'gregoire@cigogn.fr', password: '123456', password_confirmation: '123456', first_name: "Gregoire", last_name: "Lemesle")
      # file = URI.open('https://avatars0.githubusercontent.com/u/17796594?s=400&u=f6de9d96550d08d6272ed71df20e485f45bcfa83&v=4.png')
      # user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
      user.save!
user1 = User.new(email: 'laurene@cigogn.fr', password: '123456', password_confirmation: '123456', first_name: "Laurene", last_name: "Michon")
      # file = URI.open('https://avatars0.githubusercontent.com/u/70512756?v=4.png')
      # user1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
      user1.save!
user2 = User.new(email: 'marion@cigogn.fr', password: '123456', password_confirmation: '123456', first_name: "Marion", last_name: "Thomy")
      # file = URI.open('https://avatars3.githubusercontent.com/u/71773113?s=400&u=181dfa92826d6984124888a22f85f1be2d04aa8f&v=4.png')
      # user2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
      user2.save!
user3 = User.new(email: 'antony@cigogn.fr', password: '123456', password_confirmation: '123456', first_name: "Antony", last_name: "Marques")
      # file = URI.open('https://avatars0.githubusercontent.com/u/70489849?s=400&u=9c4d21f36597bcf4f647b4aa276afab4d39cf8c2&v=4.png')
      # user3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
      user3.save!

puts "Finished"

# USERS = [user, user1, user2, user3]
