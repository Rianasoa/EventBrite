# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

i = 1
3.times do |user|
  User.create!(
               first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               description: Faker::ChuckNorris.fact,
               email: "claire#{i}@yopmail.com",
               password: "rakoto#{i}")
  i+=1
end

i = 1
3.times do |event|
  Event.create!(
                title: "Mon super event #{i}",
                description: "La description super géniale de mon super event #{i}",
                price: rand(1...1000),
                location: Faker::Address.city,
                start_date: Faker::Date.forward,
                duration: 5 * rand(1..120),
                admin_id: User.all.sample.id)
  i+=1
end

4.times do |attendance|
  Attendance.create!(
                     stripe_customer_id: Faker::Lorem.characters,
                     event_id: Event.all.sample.id,
                     participant_id: User.all.sample.id)
end

puts "Success"