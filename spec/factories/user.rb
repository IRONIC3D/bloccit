FactoryGirl.define do
  factory :user do
    name "Iyad Horani"
    email "i3d@ironic3d.com"
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end
end