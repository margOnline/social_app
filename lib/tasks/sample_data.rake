namespace :db do
  desc "Fill database with sample users"
  task :populate => :environment do
    admin = User.create!(
      name: "example User",
      email: "example@gmail.com",
      password: "password",
      password_confirmation: "password" 
      )
    40.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@gmail.com"
      password = "password"
      User.create!(
        name: name,
        email: email,
        password: password,
        password_confirmation: password
        )
    end
    users = User.first(6)
    35.times do
      content = Faker::Lorem.sentence(4)
      users.each { |user| user.microposts.create(content: content) }
    end
  end

end