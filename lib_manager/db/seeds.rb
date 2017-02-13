User.create! name: "Administrator", email: "example@railstutorial.org",
  password: "123456", password_confirmation: "123456", is_admin: true

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name: name, email: email, password: password,
    password_confirmation: password
end

10.times do |n|
  name = Faker::Book.author
  email = "author-#{n+1}@gmail.org"
  Author.create! name: name, email: email
end

10.times do |n|
  name = Faker::Name.name
  add = "address-#{n+1}"
  phone = "123456789"
  email = "publisher-#{n+1}@gmail.org"
  Publisher.create! name: name, add: add, phone: phone, email: email
end
