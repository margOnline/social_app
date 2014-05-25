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
  end

end