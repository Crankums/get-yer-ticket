# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Customer.destroy_all

User.create(name: "Cranky", password: "tesTing123", password_confirmation: "tesTing123", email: "test@test.com")
User.create(name: "Crabby", password: "tesTing123", password_confirmation: "tesTing123", email: "test2@test2.com")
User.create(name: "Boss", password: "tesTing123", password_confirmation: "tesTing123", email: "test3@test3.com", admin: true)

Customer.create(name: "Fred", email: "fred@fred.com", phone_number: "555-5555")
Customer.create(name: "George", email: "george@george.com", phone_number: "555-5555")

bike = Bike.create([{ make: 'Specialized', model_series: 'Allez', color: "Red", size: "52"}, { make: "Cannondale", model_series: "Bad Boy", color: "Black", size: "17"}, { make: "Kona", model_series: "Honzo", color: "Green", size: "Med"}])