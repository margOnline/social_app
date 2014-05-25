FactoryGirl.define do 
  # sequence(:name) { |n| "user#{n}" }
  # factory :user do
  #   name  { FactoryGirl.generate(:name) }
  #   email { |u| "#{FactoryGirl.generate(:name)}@example.com" }
  #   password "passw0rd"
  #   password_confirmation "passw0rd"
  factory :user do
    sequence(:name)       { |n| "Person #{n}" }
    sequence(:email)      { |n| "person_#{n}@example.com"}
    password              "passw0rd"
    password_confirmation "passw0rd"

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content "Ipsem lorem"
    user
  end
end