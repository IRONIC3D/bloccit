FactoryGirl.define do
  factory :user do
    name "Iyad Horani"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
    role ""
  end

  factory :admin, class: User do
    name "Admin person"
    sequence(:email, 100) { |n| "admin#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
    role "admin"
  end
end