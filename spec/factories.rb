FactoryGirl.define do 
  # sequence(:name) { |n| "user#{n}" }
  # factory :user do
  #   name  { FactoryGirl.generate(:name) }
  #   email { |u| "#{FactoryGirl.generate(:name)}@example.com" }
  #   password "passw0rd"
  #   password_confirmation "passw0rd"
  factory :user do
    name                  "Michael Hartl"
    email                 "michael@example.com"
    password              "passw0rd"
    password_confirmation "passw0rd"
  end
end