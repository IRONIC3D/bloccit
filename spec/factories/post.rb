FactoryGirl.define do
  factory :post do
    title "First Post"
    body "This is the newest post. It needs 20 chat to be saevd."
    user
    topic
  end
end