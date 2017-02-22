User.create! name: "Administrator", email: "example@railstutorial.org",
  password: "123456", password_confirmation: "123456", is_admin: true

User.create! name: "Administrator2", email: "example2@railstutorial.org",
    password: "123456", password_confirmation: "123456", is_admin: true

50.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create! name: name, email: email, password: password,
    password_confirmation: password
end

10.times do |n|
  name = Faker::Book.author
  email = Faker::Internet.email
  Author.create! name: name, email: email
end

10.times do |n|
  name = Faker::Book.publisher
  add = Faker::Address.street_address
  phone = Faker::PhoneNumber.phone_number
  email = Faker::Internet.email
  Publisher.create! name: name, add: add, phone: phone, email: email
end

10.times do |n|
  name = Faker::Book.genre
  Category.create! name: name
end
