# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require 'json'
require 'net/http'



User.destroy_all
Name.destroy_all
Choice.destroy_all

puts "Creating users"
user = User.new(email: 'gregoire@cigogn.fr', password: '123456', password_confirmation: '123456', first_name: "Gregoire", last_name: "Lemesle")
      # file = URI.open('https://avatars0.githubusercontent.com/u/17796594?s=400&u=f6de9d96550d08d6272ed71df20e485f45bcfa83&v=4.png')
      # user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
      user.save
user1 = User.new(email: 'laurene@cigogn.fr', password: '123456', password_confirmation: '123456', first_name: "Laurene", last_name: "Michon")
      # file = URI.open('https://avatars0.githubusercontent.com/u/70512756?v=4.png')
      # user1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
      user1.save
user2 = User.new(email: 'marion@cigogn.fr', password: '123456', password_confirmation: '123456', first_name: "Marion", last_name: "Thomy")
      # file = URI.open('https://avatars3.githubusercontent.com/u/71773113?s=400&u=181dfa92826d6984124888a22f85f1be2d04aa8f&v=4.png')
      # user2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
      user2.save
user3 = User.new(email: 'antony@cigogn.fr', password: '123456', password_confirmation: '123456', first_name: "Antony", last_name: "Marques")
      # file = URI.open('https://avatars0.githubusercontent.com/u/70489849?s=400&u=9c4d21f36597bcf4f647b4aa276afab4d39cf8c2&v=4.png')
      # user3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
      user3.save

puts "Finished"

puts "Creating names"

name = Name.new(name: "marion", gender: "girl", origin: ["hebrew"], etymology: "myriam", meaning: "Marion as a girl's name is of French origin and a variant of the Latin for Mary, 'star of the sea'. This form was changed into Marian when introduced to Britain in the Middle Ages, but was revived in the 19th century.", personality: "Live an easy, uncomplicated life.", popularity: "popular", astrology: "pisces", feast_day: "15/08")
name.save!

name1 = Name.new(name: "antony", gender: "boy", origin: ["french", "latin"], etymology: "anthos, anthonus", meaning: "highly praiseworthy.", personality: "to lead the way for others. Live the thrill of the moment.", popularity: "rare", astrology: "scorpio", feast_day: "13/06")
name1.save!

name2 = Name.new(name: "camille", gender: "unisex", origin: ["french", "english", "latin"], etymology: "camillius", meaning: "Camille comes from the French Camilla, which gets its Latin heritage from Camillus, an old Roman surname. Back in the day, Camillus meant a boy who helped the priests during Mass. Though Camille is known as a girls' name in the US, it has been a boys' name even longer in French-speaking countries (think Camille Pissarro, the celebrated French impressionist painter).", personality: "To triomph and survive against all opposition.", popularity: "popular", astrology: "leo", feast_day: "14/07")
name2.save!

name3 = Name.new(name: "laurene", gender: "girl", origin: ["french"], etymology: "laurentum", meaning: "laurus.", personality: "laurene is a simple and natural woman who has her feet on the ground.", popularity: "rare", astrology: "aries", feast_day: "10/08")
name3.save!
puts "Finished"


puts "Creating name from json"

url = "https://opendata.paris.fr/api/records/1.0/search/?dataset=liste_des_prenoms&q=&rows=20&facet=sexe&facet=annee&facet=prenoms"
uri = URI(url)

response = Net::HTTP.get(uri)
j = JSON.parse(response)

p j["records"].class
j["records"].each do |r|

  f = r["fields"]
  p f["prenoms"]
  p f["sexe"]

  n = Name.new
  n.name = f["prenoms"]
  if f["sexe"] == "M"
    n.gender = "boy"
  else
    n.gender = "girl"
  end
  puts n.gender
  n.save!
end





# USERS = [user, user1, user2, user3]
